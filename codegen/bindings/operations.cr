module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Operations < Base
    @target_prefix : String
    @endpoint_prefix : String
    @json_version : String
    @api_version : String
    @operations : Array(Crinja::Value)

    getter operations, target_prefix, endpoint_prefix, json_version, has_errors, api_version

    def initialize(description : Amazonite::Codegen::Service::Description, has_errors : Bool? = nil)
      metadata = description.metadata
      @has_errors = has_errors.nil? ? description.has_errors : has_errors
      @target_prefix = metadata.target_prefix
      @endpoint_prefix = metadata.endpoint_prefix
      @json_version = metadata.json_version
      is_rest = metadata.protocol == "rest-json"
      is_query = metadata.protocol == "query"
      @api_version = description.api_version

      @operations = description.operations.map do |operation|
        # A 204 response has no body by HTTP definition, regardless of
        # whether Smithy still models an (always-empty) output shape for it.
        no_output = operation.output.nil? || operation.http.response_code == 204

        output_type = no_output ? nil : "#{description.module_alias}::#{operation.output}"
        output = no_output ? "Core::Response" : "Core::ParsedResponse(#{output_type})"

        input_shape = is_rest && operation.input ? structure_for(description, operation.input.as(String)) : nil
        output_shape = is_rest && !no_output ? structure_for(description, operation.output.as(String)) : nil

        request = rest_request_fields(operation, input_shape)
        response = rest_response_fields(output_type, output_shape)
        doc = Amazonite::Codegen::Service::Utils.doc_comment(operation.documentation)

        Crinja.value({
          function_name: operation.lower_name,
          command:       operation.name,
          has_input:     !!operation.input,
          input:         "#{description.module_alias}::#{operation.input}",
          output:        output,
          is_rest:       is_rest,
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

    private def rest_request_fields(operation, input_shape : Amazonite::Codegen::Service::Structure?)
      members = input_shape.try(&.members) || [] of Amazonite::Codegen::Service::Member
      labels = members.select(&.label?)
      query_members = members.select(&.query?)
      header_members = members.select(&.header?)
      payload_member = input_shape.try(&.payload_member).try { |payload_name| members.find! { |member| member.name == payload_name } }
      body_members = members.select(&.body?)

      body_expr = if payload_member
                    payload_member.structure_type? ? "input.#{payload_member.snake_case_name}.try(&.to_json)" : "input.#{payload_member.snake_case_name}"
                  elsif body_members.empty?
                    nil
                  else
                    "input.to_json"
                  end

      {
        http_method:         operation.http.method,
        path_literal:        path_literal(operation.http.request_uri, labels),
        has_query:           !query_members.empty?,
        query_adds:          query_members.map { |member| wire_add(member) },
        has_request_headers: !header_members.empty?,
        request_headers:     header_members.map { |member| wire_add(member) },
        has_body:            !body_expr.nil?,
        body_expr:           body_expr || "nil",
      }
    end

    private def path_literal(uri_template : String, labels : Array(Amazonite::Codegen::Service::Member)) : String
      path = uri_template
      labels.each do |label|
        accessor = "input.#{label.snake_case_name}"
        path = path.gsub("{#{label.wire_name}}", "\#{URI.encode_path_segment(#{accessor})}")
      end
      %("#{path}")
    end

    # A single query-string or header value, built from one input member. AWS
    # represents a list-typed query/header member as the same key repeated
    # once per element (e.g. "tagKeys=a&tagKeys=b"), not a single serialized
    # array, so that case needs its own iterating form rather than the plain
    # "if value = ..." used for scalars.
    private def wire_add(member : Amazonite::Codegen::Service::Member)
      if member.list_type?
        Crinja.value({
          wire_name:      member.wire_name,
          is_list:        true,
          list_accessor:  "input.#{member.snake_case_name}",
          list_item_type: member.list_item_crystal_type,
          item_expr:      list_item_expr(member),
        })
      else
        Crinja.value({wire_name: member.wire_name, is_list: false, value_expr: wire_value_expr(member)})
      end
    end

    private def wire_value_expr(member : Amazonite::Codegen::Service::Member) : String
      accessor = "input.#{member.snake_case_name}"
      if member.enum_type?
        "#{accessor}.try(&.to_json_object_key)"
      elsif member.crystal_type(true) == "String"
        accessor
      else
        "#{accessor}.try(&.to_s)"
      end
    end

    private def list_item_expr(member : Amazonite::Codegen::Service::Member) : String
      if member.list_of_enum?
        "value.to_json_object_key"
      elsif member.list_item_crystal_type == "String"
        "value"
      else
        "value.to_s"
      end
    end

    private def rest_response_fields(output_type, output_shape : Amazonite::Codegen::Service::Structure?)
      no_custom = {custom_output: false, output_type: output_type, output_assignments: [] of Crinja::Value}
      return no_custom if output_shape.nil?

      header_members = output_shape.members.select(&.header?)
      status_member = output_shape.members.find(&.status_code?)
      payload_member = output_shape.payload_member.try { |payload_name| output_shape.members.find! { |member| member.name == payload_name } }

      return no_custom if header_members.empty? && status_member.nil? && payload_member.nil?

      assignments = header_members.map { |member| Crinja.value({name: member.snake_case_name, value_expr: %(response.headers["#{member.wire_name}"]?)}) }
      assignments << Crinja.value({name: status_member.snake_case_name, value_expr: "response.status_code"}) if status_member
      if payload_member
        payload_expr = payload_member.structure_type? ? "#{payload_member.crystal_type(true)}.from_json(response.body)" : "response.body"
        assignments << Crinja.value({name: payload_member.snake_case_name, value_expr: payload_expr})
      end

      {custom_output: true, output_type: output_type, output_assignments: assignments}
    end
  end
end
