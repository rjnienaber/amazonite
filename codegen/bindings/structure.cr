module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Structure < Base
    @name : String
    @members : Array(Crinja::Value)
    @has_parameters : Bool
    @payload_member : String?

    getter name, members, has_parameters, parameters, needs_core_alias, needs_module_alias

    def initialize(shape : Amazonite::Codegen::Service::Structure, module_alias : String, is_rest : Bool)
      @name = shape.name
      @needs_core_alias = false
      @needs_module_alias = false
      @is_rest = is_rest
      @payload_member = shape.payload_member
      @members = shape.members.map { |member| member_value(member, module_alias) }

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
  end
end
