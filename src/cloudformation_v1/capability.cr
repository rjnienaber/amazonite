private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum Capability
    CapabilityIam
    CapabilityNamedIam
    CapabilityAutoExpand

    def self.to_json(e : Capability, json : JSON::Builder) : Nil
      value = case e
              when ACF::Capability::CapabilityIam        then "CAPABILITY_IAM"
              when ACF::Capability::CapabilityNamedIam   then "CAPABILITY_NAMED_IAM"
              when ACF::Capability::CapabilityAutoExpand then "CAPABILITY_AUTO_EXPAND"
              else
                raise Exception.new("unknown enum value for 'Capability' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::Capability
      value = pull.read_string
      case value
      when "CAPABILITY_IAM"         then ACF::Capability::CapabilityIam
      when "CAPABILITY_NAMED_IAM"   then ACF::Capability::CapabilityNamedIam
      when "CAPABILITY_AUTO_EXPAND" then ACF::Capability::CapabilityAutoExpand
      else
        raise Exception.new("unknown enum value for 'Capability' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::Capability::CapabilityIam        then "CAPABILITY_IAM"
      when ACF::Capability::CapabilityNamedIam   then "CAPABILITY_NAMED_IAM"
      when ACF::Capability::CapabilityAutoExpand then "CAPABILITY_AUTO_EXPAND"
      else
        raise Exception.new("unknown enum value for 'Capability' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::Capability?
      case key
      when "CAPABILITY_IAM"         then ACF::Capability::CapabilityIam
      when "CAPABILITY_NAMED_IAM"   then ACF::Capability::CapabilityNamedIam
      when "CAPABILITY_AUTO_EXPAND" then ACF::Capability::CapabilityAutoExpand
      else
        nil
      end
    end
  end
end
