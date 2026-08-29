module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Structure < Base
    @name : String
    @members : Array(Crinja::Value)
    @has_parameters : Bool
    @payload_member : String?
    @query_adds : Array(Crinja::Value)
    @xml_reads : Array(Crinja::Value)
    @module_alias : String

    getter name, members, has_parameters, parameters, needs_core_alias, needs_module_alias, query_adds, xml_reads

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String, is_rest : Bool, is_query : Bool = false)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      @is_rest = is_rest
      @module_alias = module_alias
      @payload_member = shape.payload_member
      @members = shape.members.map { |member| member_value(member, module_alias) }
      if is_query
        @query_adds = shape.members.map { |member| Crinja.value({stmt: query_param_stmt(member)}) }
        @xml_reads = shape.members.map { |member| Crinja.value({name: member.snake_case_name, expr: xml_read_expr(member)}) }
      else
        @query_adds = [] of Crinja::Value
        @xml_reads = [] of Crinja::Value
      end

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

      Crinja.value({
        name:            member.name,
        snake_case_name: member.snake_case_name,
        type:            member_type(member),
        has_converter:   !!converter,
        converter:       converter,
        has_default:     !!default,
        default:         default,
        ignore:          not_in_body?(member),
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
      @is_rest && (member.label? || member.query? || member.header? || member.status_code?)
    end

    private def member_default(member)
      return "[] of #{member.list_item_crystal_type}" if member.required? && member.list_type?

      # An ignored property still needs a default so JSON::Serializable's
      # generated JSON constructor compiles when the member is otherwise
      # required (non-nilable) - it's never actually read back through
      # JSON, since rest-json operations build/consume these members via
      # the URI, query string, or headers directly.
      zero_value(member.crystal_type(true)) if not_in_body?(member) && member.required?
    end

    private def zero_value(crystal_type : String) : String
      case crystal_type
      when "String"             then "\"\""
      when "Bool"               then "false"
      when "Int32", "Int64"     then "0"
      when "Float32", "Float64" then "0.0"
      else
        raise Exception.new("no zero value known for required non-body member of type '#{crystal_type}'")
      end
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

    private def scalar_param_stmt(member, accessor) : String
      entry = %(params << {"\#{prefix}#{member.wire_name}", #{query_value_expr(member.required? ? accessor : "value", member)}})
      member.required? ? entry : "if value = #{accessor}\n  #{entry}\nend"
    end

    private def structure_param_stmt(member, accessor) : String
      value_accessor = member.required? ? accessor : "value"
      concat = %(params.concat(#{value_accessor}.to_query_params("\#{prefix}#{member.wire_name}.")))
      member.required? ? concat : "if value = #{accessor}\n  #{concat}\nend"
    end

    private def list_param_stmt(member, accessor) : String
      item = member.list_item_member
      list_accessor = member.required? ? accessor : "(#{accessor} || [] of #{member.list_item_crystal_type})"
      item_stmt = if item.structure_type?
                    %(params.concat(item.to_query_params("\#{prefix}#{member.wire_name}.member.\#{i}.")))
                  else
                    %(params << {"\#{prefix}#{member.wire_name}.member.\#{i}", #{query_value_expr("item", item)}})
                  end
      "#{list_accessor}.each_with_index(1) do |item, i|\n  #{item_stmt}\nend"
    end

    private def map_param_stmt(member, accessor) : String
      key = member.map_key_member
      value = member.map_value_member
      map_accessor = member.required? ? accessor : "(#{accessor} || {} of #{key.crystal_type(true)} => #{value.crystal_type(true)})"
      key_stmt = %(params << {"\#{prefix}#{member.wire_name}.entry.\#{i}.#{key.wire_name}", #{query_value_expr("key", key)}})
      value_stmt = if value.structure_type?
                     %(params.concat(value.to_query_params("\#{prefix}#{member.wire_name}.entry.\#{i}.#{value.wire_name}.")))
                   else
                     %(params << {"\#{prefix}#{member.wire_name}.entry.\#{i}.#{value.wire_name}", #{query_value_expr("value", value)}})
                   end
      "#{map_accessor}.each_with_index(1) do |(key, value), i|\n  #{key_stmt}\n  #{value_stmt}\nend"
    end

    # The wire-text expression for one scalar (non-structure) value -
    # `accessor` is always a definitely-non-nil local (either a required
    # property or an `if value = ...`-bound optional one).
    private def query_value_expr(accessor : String, member) : String
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

    private def list_read_expr(member) : String
      item = member.list_item_member
      nodes = %(node.xpath_nodes("#{xp(member.wire_name)}/#{xp("member")}"))
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
      %(node.xpath_nodes("#{xp(member.wire_name)}/#{xp("entry")}").each_with_object({} of #{key.crystal_type(true)} => #{value.crystal_type(true)}) { |entry, hash| hash[#{key_content}] = #{value_expr} })
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
