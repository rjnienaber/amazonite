module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Operations < Base
    @target_prefix : String
    @endpoint_prefix : String
    @json_version : String
    @api_version : String
    @module_alias : String
    @operations : Array(Crinja::Value)

    getter operations, target_prefix, endpoint_prefix, json_version, has_errors, api_version

    def initialize(description : Amazonite::Codegen::Service::Description, has_errors : Bool? = nil)
      metadata = description.metadata
      @has_errors = has_errors.nil? ? description.has_errors : has_errors
      @target_prefix = metadata.target_prefix
      @endpoint_prefix = metadata.endpoint_prefix
      @json_version = metadata.json_version
      # rest-json and rest-xml share the whole http-routing half of a request
      # (uri labels, httpQuery, httpHeader, httpPayload) and differ only in
      # how the body itself is serialized, so both take the "rest" branch.
      is_rest_xml = metadata.protocol == "rest-xml"
      is_rest = metadata.protocol == "rest-json" || is_rest_xml
      is_query = metadata.protocol == "query"
      @api_version = description.api_version
      @module_alias = description.module_alias

      @operations = description.operations.map do |operation|
        # A 204 response has no body by HTTP definition, regardless of
        # whether Smithy still models an (always-empty) output shape for it.
        no_output = operation.output.nil? || operation.http.response_code == 204

        output_type = no_output ? nil : "#{description.module_alias}::#{operation.output}"
        output = no_output ? "Core::Response" : "Core::ParsedResponse(#{output_type})"

        input_shape = is_rest && operation.input ? structure_for(description, operation.input.as(String)) : nil
        output_shape = is_rest && !no_output ? structure_for(description, operation.output.as(String)) : nil

        request = rest_request_fields(operation, input_shape, is_rest_xml)
        response = rest_response_fields(output_type, output_shape, is_rest_xml)
        doc = Amazonite::Codegen::Service::Utils.doc_comment(operation.documentation)

        Crinja.value({
          function_name: operation.lower_name,
          command:       operation.name,
          has_input:     !!operation.input,
          input:         "#{description.module_alias}::#{operation.input}",
          output:        output,
          is_rest:       is_rest,
          is_rest_xml:   is_rest_xml,
          is_query:      is_query,
          doc:           doc,
          has_doc:       !!doc,

          http_method:         request[:http_method],
          path_literal:        request[:path_literal],
          has_query:           request[:has_query],
          query_adds:          request[:query_adds],
          has_request_headers: request[:has_request_headers],
          request_headers:     request[:request_headers],
          has_body:            request[:has_body],
          body_expr:           request[:body_expr],

          custom_output:      response[:custom_output],
          parse_body:         response[:parse_body],
          output_type:        response[:output_type],
          output_assignments: response[:output_assignments],

          no_output:        no_output,
          output_type_bare: output_type,
          result_element:   "#{operation.name}Result",
        })
      end
    end

    private def structure_for(description, shape_name) : Amazonite::Codegen::Service::Structure
      description.resolver.find(shape_name).as(Amazonite::Codegen::Service::Structure)
    end

    private def rest_request_fields(operation, input_shape : Amazonite::Codegen::Service::Structure?, is_rest_xml : Bool)
      members = input_shape.try(&.members) || [] of Amazonite::Codegen::Service::Member
      labels = members.select(&.label?)
      query_members = members.select(&.query?)
      header_members = members.select(&.header?)
      prefix_header_members = members.select(&.prefix_headers?)
      payload_member = input_shape.try(&.payload_member).try { |payload_name| members.find! { |member| member.name == payload_name } }
      body_members = members.select(&.body?)

      body_expr = body_expr(input_shape, payload_member, body_members, is_rest_xml)

      # A URI template can carry a query string of its own (S3 routes
      # operations that share a path by it, e.g. "/{Bucket}?tagging"), which
      # belongs to the route rather than to anything the input models. Split
      # it off so the path stays a path, and fold its pairs in as constant
      # query adds - they have to end up in the same URI::Params as the
      # httpQuery members rather than being concatenated separately, or an
      # operation with both would emit two "?" separators.
      uri, _, literal_query = operation.http.request_uri.partition('?')
      literal_adds = literal_query.empty? ? [] of Crinja::Value : literal_query.split('&').map { |pair| literal_query_add(pair) }
      query_adds = literal_adds + query_members.map { |member| query_add(member) }

      {
        http_method:         operation.http.method,
        path_literal:        path_literal(uri, labels),
        has_query:           !query_adds.empty?,
        query_adds:          query_adds,
        has_request_headers: !header_members.empty? || !prefix_header_members.empty?,
        request_headers:     header_members.map { |member| header_add(member) } + prefix_header_members.map { |member| prefix_header_add(member) },
        has_body:            !body_expr.nil?,
        body_expr:           body_expr || "nil",
      }
    end

    private def path_literal(uri_template : String, labels : Array(Amazonite::Codegen::Service::Member)) : String
      path = uri_template
      labels.each do |label|
        accessor = "input.#{label.snake_case_name}"
        # A greedy label ({Key+}) binds the whole remainder of the path,
        # separators included, so it's encoded as a path rather than as one
        # segment - S3 object keys routinely contain "/" and splitting them
        # into escaped segments would address a different object.
        path = if path.includes?("{#{label.wire_name}+}")
                 path.gsub("{#{label.wire_name}+}", "\#{URI.encode_path(#{accessor})}")
               else
                 path.gsub("{#{label.wire_name}}", "\#{URI.encode_path_segment(#{accessor})}")
               end
      end
      %("#{path}")
    end

    # One "key" or "key=value" pair lifted straight out of a URI template's
    # own query string. S3 uses the valueless form as a subresource marker
    # ("?acl"), which URI::Params renders as "acl=" rather than a bare "acl" -
    # the same form SigV4 canonicalizes a valueless parameter to, and what S3
    # matches the subresource on, so both forms go through the same add.
    private def literal_query_add(pair : String) : Crinja::Value
      key, _, value = pair.partition('=')
      Crinja.value({wire_name: key, is_list: false, is_literal: true, literal_value: value})
    end

    # The request body, if the operation has one. A payload member *is* the
    # body (serialized under the name that member binds it to, which restXml
    # takes from the member rather than from the shape); otherwise the body
    # members are serialized together as the input shape itself.
    private def body_expr(input_shape, payload_member, body_members, is_rest_xml : Bool) : String?
      if payload_member
        return "input.#{payload_member.snake_case_name}" unless payload_member.structure_type?

        serialize = is_rest_xml ? %(to_xml("#{payload_member.wire_name}")) : "to_json"
        "input.#{payload_member.snake_case_name}.try(&.#{serialize})"
      elsif body_members.empty? || input_shape.nil?
        nil
      elsif is_rest_xml
        %(input.to_xml("#{input_shape.name}"))
      else
        "input.to_json"
      end
    end

    # A single query-string value, built from one input member. AWS
    # represents a list-typed query member as the same key repeated once per
    # element (e.g. "tagKeys=a&tagKeys=b"), not a single serialized array, so
    # that case needs its own iterating form rather than the plain
    # "if value = ..." used for scalars.
    private def query_add(member : Amazonite::Codegen::Service::Member)
      if member.list_type?
        Crinja.value({
          wire_name:      member.wire_name,
          is_list:        true,
          is_literal:     false,
          list_accessor:  "input.#{member.snake_case_name}",
          list_item_type: member.list_item_crystal_type,
          item_expr:      list_item_expr(member, "value", "date-time"),
        })
      else
        Crinja.value({wire_name: member.wire_name, is_list: false, is_literal: false, value_expr: wire_value_expr(member, "date-time")})
      end
    end

    # A single header, built from one input member. Unlike a query member, a
    # list-typed one is sent as a single comma-joined header rather than
    # repeated, which is what Smithy's httpHeader binding specifies and what
    # SigV4 canonicalizes to.
    private def header_add(member : Amazonite::Codegen::Service::Member)
      if member.list_type?
        Crinja.value({
          wire_name: member.wire_name,
          is_list:   true,
          is_prefix: false,
          accessor:  "input.#{member.snake_case_name}",
          item_expr: list_item_expr(member, "item", "http-date"),
        })
      else
        Crinja.value({wire_name: member.wire_name, is_list: false, is_prefix: false, value_expr: wire_value_expr(member, "http-date")})
      end
    end

    # A map member bound to a whole family of headers by a shared prefix
    # (smithy.api#httpPrefixHeaders) - each entry becomes its own header
    # named by the prefix plus the entry's key.
    private def prefix_header_add(member : Amazonite::Codegen::Service::Member)
      key = member.map_key_member
      value = member.map_value_member
      Crinja.value({
        wire_name: member.wire_name,
        is_list:   false,
        is_prefix: true,
        accessor:  "(input.#{member.snake_case_name} || {} of #{key.crystal_type(true)} => #{value.crystal_type(true)})",
      })
    end

    # `default_time_format` is the timestamp format the member's binding
    # implies (http-date for a header, date-time for a query string), used
    # unless the shape itself overrides it.
    private def wire_value_expr(member : Amazonite::Codegen::Service::Member, default_time_format : String) : String
      accessor = "input.#{member.snake_case_name}"
      if member.enum_type?
        "#{accessor}.try(&.to_json_object_key)"
      elsif member.time_type?
        "#{accessor}.try { |time| Core::HeaderValue.#{time_format_method(member, default_time_format, "format_")}(time) }"
      elsif member.crystal_type(true) == "String"
        accessor
      else
        "#{accessor}.try(&.to_s)"
      end
    end

    private def list_item_expr(member : Amazonite::Codegen::Service::Member, item_var : String, default_time_format : String) : String
      item = member.list_item_member
      if member.list_of_enum?
        "#{item_var}.to_json_object_key"
      elsif item.time_type?
        "Core::HeaderValue.#{time_format_method(item, default_time_format, "format_")}(#{item_var})"
      elsif member.list_item_crystal_type == "String"
        item_var
      else
        "#{item_var}.to_s"
      end
    end

    # The Core::HeaderValue method for a timestamp member's wire format -
    # `prefix` picks the writing ("format_") or reading (empty) direction.
    private def time_format_method(member, default_time_format : String, prefix : String) : String
      case member.timestamp_format || default_time_format
      when "date-time"     then "#{prefix}date_time"
      when "epoch-seconds" then "#{prefix}epoch"
      else                      "#{prefix}http_time"
      end
    end

    private def rest_response_fields(output_type, output_shape : Amazonite::Codegen::Service::Structure?, is_rest_xml : Bool)
      no_custom = {custom_output: false, parse_body: false, output_type: output_type, output_assignments: [] of Crinja::Value}
      return no_custom if output_shape.nil?

      header_members = output_shape.members.select(&.header?)
      prefix_header_members = output_shape.members.select(&.prefix_headers?)
      status_member = output_shape.members.find(&.status_code?)
      payload_name = output_shape.payload_member
      payload_member = payload_name.try { |name| output_shape.members.find! { |member| member.name == name } }
      body_members = output_shape.members.select { |member| member.body? && member.name != payload_name }

      # A rest-xml body is read by the shape's own from_xml rather than
      # assembled member by member here, so those operations always take the
      # custom path - either to parse that body first and then layer the
      # http-bound members on top of it as setters, or (with no body at all)
      # to build the result from those members alone.
      parse_body = is_rest_xml && !body_members.empty?
      http_bound = !header_members.empty? || !prefix_header_members.empty? || !status_member.nil? || !payload_member.nil?
      # rest-xml never reaches ParsedResponse's default JSON parse, so an
      # output shape always takes the custom path even when nothing is bound
      # to the http response at all.
      return no_custom if !is_rest_xml && !http_bound

      assignments = response_assignments(output_shape, status_member, payload_member, is_rest_xml)
      {custom_output: true, parse_body: parse_body, output_type: output_type, output_assignments: assignments}
    end

    # One assignment per http-bound output member, in the order the client
    # method applies them - either as named arguments to the output shape's
    # constructor, or as setters over a body already parsed from XML.
    private def response_assignments(output_shape, status_member, payload_member, is_rest_xml : Bool) : Array(Crinja::Value)
      assignments = [] of Crinja::Value
      output_shape.members.each do |member|
        if member.header?
          assignments << Crinja.value({name: member.snake_case_name, value_expr: header_read_expr(member)})
        elsif member.prefix_headers?
          assignments << Crinja.value({name: member.snake_case_name, value_expr: %(Core::HeaderValue.prefixed(response.headers, "#{member.wire_name}"))})
        end
      end
      assignments << Crinja.value({name: status_member.snake_case_name, value_expr: "response.status_code"}) if status_member
      assignments << Crinja.value({name: payload_member.snake_case_name, value_expr: payload_read_expr(payload_member, is_rest_xml)}) if payload_member
      assignments
    end

    private def payload_read_expr(payload_member, is_rest_xml : Bool) : String
      return "response.body" unless payload_member.structure_type?

      type = payload_member.crystal_type(true)
      is_rest_xml ? "#{type}.from_xml(XML.parse(response.body).root.not_nil!)" : "#{type}.from_json(response.body)"
    end

    # A header holds plain text, so every non-String member type needs its
    # own conversion back - and a timestamp's format follows the binding
    # (http-date for a header) unless the shape overrides it.
    private def header_read_expr(member : Amazonite::Codegen::Service::Member) : String
      raw = %(response.headers["#{member.wire_name}"]?)
      expr = if member.time_type?
               "Core::HeaderValue.#{time_format_method(member, "http-date", "")}(#{raw})"
             elsif member.enum_type?
               "#{raw}.try { |value| #{@module_alias}::#{member.crystal_type(true)}.from_json_object_key?(value) }"
             elsif member.list_type?
               list_header_read_expr(member, raw)
             else
               scalar_header_read_expr(member, raw)
             end
      member.required? ? "#{expr}.not_nil!" : expr
    end

    private def list_header_read_expr(member, raw : String) : String
      values = "Core::HeaderValue.list(#{raw})"
      item = member.list_item_member
      if member.list_of_enum?
        "#{values}.try(&.compact_map { |value| #{@module_alias}::#{member.list_enum_crystal_type}.from_json_object_key?(value) })"
      elsif item.crystal_type(true) == "String"
        values
      else
        "#{values}.try(&.map { |value| #{item_convert_expr("value", item.crystal_type(true))} })"
      end
    end

    private def scalar_header_read_expr(member, raw : String) : String
      case member.crystal_type(true)
      when "String" then raw
      when "Bool"   then "Core::HeaderValue.bool(#{raw})"
      when "Int32"  then "Core::HeaderValue.i32(#{raw})"
      when "Int64"  then "Core::HeaderValue.i64(#{raw})"
      else
        raise Exception.new("no header read helper for type '#{member.crystal_type(true)}'")
      end
    end

    private def item_convert_expr(value_var : String, crystal_type : String) : String
      case crystal_type
      when "Int32"   then "#{value_var}.to_i32"
      when "Int64"   then "#{value_var}.to_i64"
      when "Float32" then "#{value_var}.to_f32"
      when "Float64" then "#{value_var}.to_f64"
      when "Bool"    then "#{value_var} == \"true\""
      else
        raise Exception.new("no header read helper for list item type '#{crystal_type}'")
      end
    end
  end
end
