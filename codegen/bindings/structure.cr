module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Structure < Base
    @name : String
    @members : Array(Crinja::Value)
    @has_parameters : Bool
    @payload_member : String?
    @query_adds : Array(Crinja::Value)
    @xml_reads : Array(Crinja::Value)
    @xml_writes : Array(Crinja::Value)
    @validations : Array(Crinja::Value)
    @module_alias : String
    @doc : String?

    getter name, members, has_parameters, parameters, needs_core_alias, needs_module_alias, query_adds, xml_reads,
      xml_writes, validations, doc, has_doc

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String, protocol : String)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      # rest-xml routes the http half of a shape exactly as rest-json does
      # and differs only in how the body is serialized; awsQuery and
      # ec2Query both form-encode the request and read an XML response,
      # differing only in how a member is named and how a list is indexed.
      @is_rest_xml = protocol == "rest-xml"
      @is_rest = protocol == "rest-json" || @is_rest_xml
      @is_ec2 = protocol == "ec2"
      is_query = protocol == "query" || @is_ec2
      @module_alias = module_alias
      @payload_member = shape.payload_member
      @doc = Amazonite::Codegen::Service::Utils.doc_comment(shape.documentation)
      @has_doc = !!@doc
      @members = shape.members.map { |member| member_value(member, module_alias) }
      if is_query
        @query_adds = shape.members.map { |member| Crinja.value({stmt: query_param_stmt(member)}) }
        @xml_reads = shape.members.map { |member| Crinja.value({name: member.snake_case_name, expr: xml_read_expr(member)}) }
        @xml_writes = [] of Crinja::Value
      elsif @is_rest_xml
        # Only the body half of the shape is XML. The rest is routed to the
        # URI, query string or headers by the client method, and a raw
        # payload member is the body rather than a part of it, so both are
        # left out of the element the shape serializes to.
        body = shape.members.reject { |member| not_in_body?(member) || member.name == @payload_member }
        @xml_reads = body.map { |member| Crinja.value({name: member.snake_case_name, expr: xml_read_expr(member)}) }
        @xml_writes = body.map { |member| Crinja.value({stmt: xml_write_stmt(member)}) }
        @query_adds = [] of Crinja::Value
      else
        @query_adds = [] of Crinja::Value
        @xml_reads = [] of Crinja::Value
        @xml_writes = [] of Crinja::Value
      end

      @validations = shape.members.compact_map { |member| validation_stmt(member) }.map { |stmt| Crinja.value({stmt: stmt}) }
      @needs_core_alias ||= !@validations.empty?

      @has_parameters = shape.members.size > 0
      @parameters = [] of Crinja::Value
      shape.members.each do |member|
        next unless member.required?

        parameters << Crinja.value({
          name:        member.snake_case_name,
          type:        member_type(member),
          is_optional: false,
        })
      end

      shape.members.each do |member|
        next if member.required?

        parameters << Crinja.value({
          name:        member.snake_case_name,
          type:        member_type(member),
          is_optional: true,
        })
      end
    end

    # A member bound by smithy.api#httpPayload never goes through JSON
    # (de)serialization - the client passes it straight through as the raw
    # HTTP body (a String), so it must keep the plain String type rather
    # than the Bytes treatment blob members otherwise get for values
    # embedded in a JSON body.
    private def raw_payload?(member)
      member.name == @payload_member && member.blob_type?
    end

    private def member_type(member)
      raw_payload?(member) ? member.crystal_type.sub("Bytes", "String") : member.crystal_type
    end

    private def member_value(member, module_alias)
      converter = raw_payload?(member) ? nil : member_converter(member, module_alias)
      default = member_default(member)
      doc = Amazonite::Codegen::Service::Utils.doc_comment(member.documentation)

      Crinja.value({
        name:            member.name,
        wire_name:       member.json_wire_name,
        snake_case_name: member.snake_case_name,
        type:            member_type(member),
        has_converter:   !!converter,
        converter:       converter,
        has_default:     !!default,
        default:         default,
        ignore:          not_in_body?(member),
        doc:             doc,
        has_doc:         !!doc,
      })
    end

    private def member_converter(member, module_alias)
      if member.time_type?
        @needs_core_alias = true
        "Core::AWSEpochConverter"
      elsif member.enum_type?
        @needs_module_alias = true
        "#{module_alias}::#{member.crystal_type(true)}"
      elsif member.list_of_enum?
        @needs_core_alias = true
        @needs_module_alias = true
        "Core::ArrayConverter(#{module_alias}::#{member.list_enum_crystal_type})"
      elsif member.blob_type?
        @needs_core_alias = true
        "Core::Base64Converter"
      elsif member.list_of_blob?
        @needs_core_alias = true
        "Core::Base64ArrayConverter"
      end
    end

    # httpLabel/httpQuery/httpHeader/httpResponseCode members are routed
    # into the URI, query string, or headers by the client method rather
    # than the JSON body, so JSON::Serializable must skip them entirely -
    # otherwise they'd also leak into a rest-json request body built from
    # the rest of the input object. Only rest-json actually honors these
    # bindings - other protocols (e.g. awsJson) always send every member
    # in the body even if the Smithy model carries a vestigial httpHeader
    # trait, so the check is gated on protocol to avoid wrongly dropping
    # such a member from those services' JSON bodies.
    private def not_in_body?(member)
      @is_rest && (member.label? || member.query? || member.header? || member.prefix_headers? || member.status_code?)
    end

    private def member_default(member)
      return "[] of #{member.list_item_crystal_type}" if member.required? && member.list_type?

      # An ignored property still needs a default so JSON::Serializable's
      # generated JSON constructor compiles when the member is otherwise
      # required (non-nilable) - it's never actually read back through
      # JSON, since rest-json operations build/consume these members via
      # the URI, query string, or headers directly.
      zero_value(member) if not_in_body?(member) && member.required?
    end

    private def zero_value(member) : String
      return "#{@module_alias}::#{member.crystal_type(true)}::#{member.enum_type.values.first}" if member.enum_type?
      return "[] of #{member.list_item_crystal_type}" if member.list_type?
      return "{} of #{member.map_key_member.crystal_type(true)} => #{member.map_value_member.crystal_type(true)}" if member.map_type?

      case member.crystal_type(true)
      when "String"             then "\"\""
      when "Bool"               then "false"
      when "Int32", "Int64"     then "0"
      when "Float32", "Float64" then "0.0"
      else
        raise Exception.new("no zero value known for required non-body member of type '#{member.crystal_type(true)}'")
      end
    end

    # --- input validation (Structure#validate!) -------------------------
    #
    # Builds one `if value = @member ... end` statement per member that
    # either carries its own min/max/pattern constraint or needs to recurse
    # into a nested structure/list/map so *its* constraints get checked
    # too. `if value = @member` is used unconditionally (not just for
    # optional members) since it's a harmless truthy-check for a required,
    # non-nilable member - Crystal only treats `nil`/`false` as falsy, so a
    # required String/Int32/etc. member always enters the block.

    private def validation_stmt(member) : String?
      lines = if member.structure_type?
                structure_validation_lines("value")
              elsif member.list_type?
                list_validation_lines(member, "value")
              elsif member.map_type?
                map_validation_lines(member, "value")
              elsif scalar_constrained?(member)
                scalar_validation_lines(member, "value")
              else
                [] of String
              end

      return if lines.empty?

      "if value = @#{member.snake_case_name}\n  #{lines.join("\n  ")}\nend"
    end

    private def scalar_constrained?(member) : Bool
      return !!(member.min || member.max || member.pattern) if member.string_type? || member.blob_type?

      member.numeric_type? && !!(member.min || member.max)
    end

    private def scalar_validation_lines(member, value_var) : Array(String)
      is_length_constraint = member.string_type? || member.blob_type?
      measured = is_length_constraint ? "#{value_var}.size" : value_var
      noun = is_length_constraint ? "length" : "value"

      lines = [] of String
      if min = member.min_literal
        lines << %(raise Core::ValidationError.new("#{member.name} #{noun} must be >= #{min}") if #{measured} < #{min})
      end
      if max = member.max_literal
        lines << %(raise Core::ValidationError.new("#{member.name} #{noun} must be <= #{max}") if #{measured} > #{max})
      end
      if member.string_type? && (pattern = member.pattern)
        # `pattern` (an arbitrary AWS-model regex, e.g. one built from
        # \uXXXX character-class escapes) is only ever embedded via
        # `.inspect` (a properly escaped Crystal string literal) - dropped
        # from the raised message entirely, since interpolating it as raw
        # text would let its own backslash escapes get reinterpreted by
        # the Crystal lexer when this generated source is parsed.
        lines << %(raise Core::ValidationError.new("#{member.name} does not match the required pattern") unless #{value_var}.matches?(Regex.new(#{pattern.inspect})))
      end
      lines
    end

    private def structure_validation_lines(value_var) : Array(String)
      ["#{value_var}.validate!"]
    end

    private def list_validation_lines(member, value_var) : Array(String)
      lines = size_validation_lines(member, value_var, "item")
      lines << "#{value_var}.each(&.validate!)" if member.list_item_member.structure_type?
      lines
    end

    private def map_validation_lines(member, value_var) : Array(String)
      lines = size_validation_lines(member, value_var, "entry")
      lines << "#{value_var}.each_value(&.validate!)" if member.map_value_member.structure_type?
      lines
    end

    private def size_validation_lines(member, value_var, noun) : Array(String)
      lines = [] of String
      if min = member.min_literal
        lines << %(raise Core::ValidationError.new("#{member.name} must have at least #{min} #{noun}(s)") if #{value_var}.size < #{min})
      end
      if max = member.max_literal
        lines << %(raise Core::ValidationError.new("#{member.name} must have at most #{max} #{noun}(s)") if #{value_var}.size > #{max})
      end
      lines
    end

    # --- awsQuery request encoding (Structure#to_query_params) ---------
    #
    # Each of these builds a snippet of *generated* Crystal source (as a
    # String) for one member's contribution to the flattened form params -
    # nested structures/list-items/map-values recurse by calling into the
    # nested type's own generated to_query_params, so no codegen-time
    # recursion is needed here beyond one level per member.

    private def query_param_stmt(member) : String
      accessor = "@#{member.snake_case_name}"
      if member.map_type?
        map_param_stmt(member, accessor)
      elsif member.list_type?
        list_param_stmt(member, accessor)
      elsif member.structure_type?
        structure_param_stmt(member, accessor)
      else
        scalar_param_stmt(member, accessor)
      end
    end

    # The form-param name for one member. ec2Query names a request param
    # differently from the response element the same member reads back from
    # (see Member#query_wire_name); awsQuery uses the one name for both.
    private def param_name(member) : String
      @is_ec2 ? member.query_wire_name : member.wire_name
    end

    private def scalar_param_stmt(member, accessor) : String
      entry = %(params << {"\#{prefix}#{param_name(member)}", #{text_value_expr(member.required? ? accessor : "value", member)}})
      member.required? ? entry : "if value = #{accessor}\n  #{entry}\nend"
    end

    private def structure_param_stmt(member, accessor) : String
      value_accessor = member.required? ? accessor : "value"
      concat = %(params.concat(#{value_accessor}.to_query_params("\#{prefix}#{param_name(member)}.")))
      member.required? ? concat : "if value = #{accessor}\n  #{concat}\nend"
    end

    private def list_param_stmt(member, accessor) : String
      item = member.list_item_member
      list_accessor = member.required? ? accessor : "(#{accessor} || [] of #{member.list_item_crystal_type})"
      # awsQuery indexes a list under a "member" segment (Names.member.1);
      # ec2Query flattens every list, indexing straight off the param name
      # (InstanceId.1).
      indexed = @is_ec2 ? %(#{param_name(member)}.\#{i}) : %(#{member.wire_name}.member.\#{i})
      item_stmt = if item.structure_type?
                    %(params.concat(item.to_query_params("\#{prefix}#{indexed}.")))
                  else
                    %(params << {"\#{prefix}#{indexed}", #{text_value_expr("item", item)}})
                  end
      "#{list_accessor}.each_with_index(1) do |item, i|\n  #{item_stmt}\nend"
    end

    private def map_param_stmt(member, accessor) : String
      key = member.map_key_member
      value = member.map_value_member
      map_accessor = member.required? ? accessor : "(#{accessor} || {} of #{key.crystal_type(true)} => #{value.crystal_type(true)})"
      key_stmt = %(params << {"\#{prefix}#{member.wire_name}.entry.\#{i}.#{key.wire_name}", #{text_value_expr("key", key)}})
      value_stmt = if value.structure_type?
                     %(params.concat(value.to_query_params("\#{prefix}#{member.wire_name}.entry.\#{i}.#{value.wire_name}.")))
                   else
                     %(params << {"\#{prefix}#{member.wire_name}.entry.\#{i}.#{value.wire_name}", #{text_value_expr("value", value)}})
                   end
      "#{map_accessor}.each_with_index(1) do |(key, value), i|\n  #{key_stmt}\n  #{value_stmt}\nend"
    end

    # The wire-text expression for one scalar (non-structure) value, shared
    # by the query protocol's form params and rest-xml's element text (both
    # encode a scalar as plain text) - `accessor` is always a definitely-
    # non-nil local (either a required property or an `if value = ...`-bound
    # optional one).
    private def text_value_expr(accessor : String, member) : String
      if member.time_type?
        @needs_core_alias = true
        "Core::QueryValue.time(#{accessor})"
      elsif member.blob_type?
        @needs_core_alias = true
        "Core::QueryValue.bytes(#{accessor})"
      elsif member.enum_type?
        "#{accessor}.to_json_object_key"
      elsif member.crystal_type(true) == "Bool"
        @needs_core_alias = true
        "Core::QueryValue.bool(#{accessor})"
      elsif member.crystal_type(true) == "String"
        accessor
      else
        "#{accessor}.to_s"
      end
    end

    # --- restXml request encoding (Structure#build_xml) ----------------
    #
    # Each of these builds a snippet of *generated* Crystal source (as a
    # String) writing one member into an XML::Builder. Nested structures
    # recurse by calling into the nested type's own generated build_xml,
    # so no codegen-time recursion is needed beyond one level per member.

    private def xml_write_stmt(member) : String
      accessor = "@#{member.snake_case_name}"
      if member.map_type?
        map_write_stmt(member, accessor)
      elsif member.list_type?
        list_write_stmt(member, accessor)
      else
        scalar_write_stmt(member, accessor)
      end
    end

    # One `<Name>...</Name>` element, whose content is either a nested
    # structure's own body or a scalar's wire text.
    private def element_write(name : String, member, value_var : String) : String
      if member.structure_type?
        %(xml.element("#{name}") { #{value_var}.build_xml(xml) })
      else
        %(xml.element("#{name}") { xml.text #{text_value_expr(value_var, member)} })
      end
    end

    private def scalar_write_stmt(member, accessor) : String
      return element_write(member.wire_name, member, accessor) if member.required?

      "if value = #{accessor}\n  #{element_write(member.wire_name, member, "value")}\nend"
    end

    private def list_write_stmt(member, accessor) : String
      item = member.list_item_member
      list_accessor = member.required? ? accessor : "(#{accessor} || [] of #{member.list_item_crystal_type})"
      # A flattened list has no wrapper of its own, so each item takes the
      # member's name; an unflattened one nests its items under it.
      item_name = member.flattened? ? member.wire_name : item_element_name(item)
      each = "#{list_accessor}.each do |item|\n  #{element_write(item_name, item, "item")}\nend"
      wrap(member, each)
    end

    private def map_write_stmt(member, accessor) : String
      key = member.map_key_member
      value = member.map_value_member
      map_accessor = member.required? ? accessor : "(#{accessor} || {} of #{key.crystal_type(true)} => #{value.crystal_type(true)})"
      entry = "#{element_write(key.wire_name, key, "key")}\n  #{element_write(value.wire_name, value, "value")}"
      entry_name = member.flattened? ? member.wire_name : "entry"
      each = "#{map_accessor}.each do |key, value|\n  xml.element(\"#{entry_name}\") do\n  #{entry}\n  end\nend"
      wrap(member, each)
    end

    # Puts a collection's repeated elements inside the member's own element,
    # unless the member is flattened - in which case they already carry its
    # name and there is nothing left to wrap them in.
    private def wrap(member, stmt : String) : String
      return stmt if member.flattened?

      %(xml.element("#{member.wire_name}") do\n  #{stmt}\nend)
    end

    # --- awsQuery/XML response decoding (Structure.from_xml) -----------

    # awsQuery responses declare a default XML namespace on the root
    # element (e.g. SNS's `xmlns="http://sns.amazonaws.com/doc/..."`), which
    # every descendant inherits - plain-name XPath steps like "TopicArn"
    # never match inside a default namespace under standard XPath 1.0
    # semantics (only prefixed or unprefixed-no-namespace elements match),
    # so every element step here is written as a local-name() predicate to
    # stay namespace-agnostic without needing to know/pass the actual URI.
    private def xp(name : String) : String
      %(*[local-name()='#{name}'])
    end

    private def xml_read_expr(member) : String
      if member.map_type?
        map_read_expr(member)
      elsif member.list_type?
        list_read_expr(member)
      elsif member.structure_type?
        base = %(node.xpath_node("#{xp(member.wire_name)}").try { |n| #{member.crystal_type(true)}.from_xml(n) })
        member.required? ? "#{base}.not_nil!" : base
      else
        scalar_read_expr(%(node.xpath_node("#{xp(member.wire_name)}")), member, member.required?)
      end
    end

    # The element a list's items sit under: its own xmlName if the model
    # gave the list member one, otherwise the protocol's default - "item"
    # for ec2Query, "member" for awsQuery and restXml.
    private def item_element_name(item) : String
      item.location_name || (@is_ec2 ? "item" : "member")
    end

    # The XPath reaching a repeated child of `node` - a flattened list/map
    # repeats its items directly under the member's own name, where an
    # unflattened one nests them inside it under a per-item element.
    private def repeated_path(member, item_name : String) : String
      member.flattened? ? xp(member.wire_name) : "#{xp(member.wire_name)}/#{xp(item_name)}"
    end

    private def list_read_expr(member) : String
      item = member.list_item_member
      nodes = %(node.xpath_nodes("#{repeated_path(member, item_element_name(item))}"))
      if item.structure_type?
        "#{nodes}.map { |n| #{item.crystal_type(true)}.from_xml(n) }"
      elsif item.enum_type?
        @needs_module_alias = true
        "#{nodes}.compact_map { |n| #{@module_alias}::#{item.crystal_type(true)}.from_json_object_key?(n.content) }"
      else
        "#{nodes}.map { |n| #{type_convert_expr("n.content", item.crystal_type(true))} }"
      end
    end

    private def map_read_expr(member) : String
      key = member.map_key_member
      value = member.map_value_member
      key_content = %(entry.xpath_node("#{xp(key.wire_name)}").not_nil!.content)
      value_node = %(entry.xpath_node("#{xp(value.wire_name)}").not_nil!)
      value_expr = present_read_expr(value_node, value)
      %(node.xpath_nodes("#{repeated_path(member, "entry")}").each_with_object({} of #{key.crystal_type(true)} => #{value.crystal_type(true)}) { |entry, hash| hash[#{key_content}] = #{value_expr} })
    end

    # A non-nilable read of a value already known to be present (a map
    # entry's value node) - handles the structure/enum/scalar cases the
    # same way list_read_expr's item handling does.
    private def present_read_expr(node_expr : String, member) : String
      if member.structure_type?
        "#{member.crystal_type(true)}.from_xml(#{node_expr})"
      elsif member.enum_type?
        @needs_module_alias = true
        "#{@module_alias}::#{member.crystal_type(true)}.from_json_object_key?(#{node_expr}.content).not_nil!"
      else
        type_convert_expr("#{node_expr}.content", member.crystal_type(true))
      end
    end

    # A nilable read of one scalar member from an XML node, honoring
    # `required` (a required member's Crystal property is non-nilable, so
    # its read expression must resolve the Optional away with `.not_nil!`).
    private def scalar_read_expr(node_expr : String, member, required : Bool) : String
      if member.time_type?
        @needs_core_alias = true
        not_nil_if_required("Core::XMLValue.time(#{node_expr})", required)
      elsif member.blob_type?
        @needs_core_alias = true
        not_nil_if_required("Core::XMLValue.bytes(#{node_expr})", required)
      elsif member.enum_type?
        @needs_module_alias = true
        # This is itself a ternary, so `.not_nil!` must wrap the whole
        # expression in parens rather than plain string-appending the call,
        # which would otherwise bind only to the `nil` arm.
        ternary = "(n = #{node_expr}) ? #{@module_alias}::#{member.crystal_type(true)}.from_json_object_key?(n.content) : nil"
        required ? "(#{ternary}).not_nil!" : ternary
      else
        @needs_core_alias = true
        not_nil_if_required("Core::XMLValue.#{xml_value_method(member.crystal_type(true))}(#{node_expr})", required)
      end
    end

    private def not_nil_if_required(expr : String, required : Bool) : String
      required ? "#{expr}.not_nil!" : expr
    end

    private def xml_value_method(crystal_type : String) : String
      case crystal_type
      when "String"  then "string"
      when "Int32"   then "i32"
      when "Int64"   then "i64"
      when "Float32" then "f32"
      when "Float64" then "f64"
      when "Bool"    then "bool"
      else
        raise Exception.new("no XML read helper for type '#{crystal_type}'")
      end
    end

    # A non-nilable text -> Crystal-type conversion, for a value already
    # known to be present (a list item or a map entry's key/value node).
    private def type_convert_expr(content_expr : String, crystal_type : String) : String
      case crystal_type
      when "String"  then content_expr
      when "Int32"   then "#{content_expr}.to_i32"
      when "Int64"   then "#{content_expr}.to_i64"
      when "Float32" then "#{content_expr}.to_f32"
      when "Float64" then "#{content_expr}.to_f64"
      when "Bool"    then "#{content_expr} == \"true\""
      when "Bytes"   then "Base64.decode(#{content_expr})"
      when "Time"    then "Time.parse_iso8601(#{content_expr})"
      else
        raise Exception.new("no XML read helper for type '#{crystal_type}'")
      end
    end
  end
end
