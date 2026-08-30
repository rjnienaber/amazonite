private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ProvisioningType
    NonProvisionable
    Immutable
    FullyMutable

    def self.to_json(e : ProvisioningType, json : JSON::Builder) : Nil
      value = case e
              when ACF::ProvisioningType::NonProvisionable then "NON_PROVISIONABLE"
              when ACF::ProvisioningType::Immutable        then "IMMUTABLE"
              when ACF::ProvisioningType::FullyMutable     then "FULLY_MUTABLE"
              else
                raise Exception.new("unknown enum value for 'ProvisioningType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ProvisioningType
      value = pull.read_string
      case value
      when "NON_PROVISIONABLE" then ACF::ProvisioningType::NonProvisionable
      when "IMMUTABLE"         then ACF::ProvisioningType::Immutable
      when "FULLY_MUTABLE"     then ACF::ProvisioningType::FullyMutable
      else
        raise Exception.new("unknown enum value for 'ProvisioningType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ProvisioningType::NonProvisionable then "NON_PROVISIONABLE"
      when ACF::ProvisioningType::Immutable        then "IMMUTABLE"
      when ACF::ProvisioningType::FullyMutable     then "FULLY_MUTABLE"
      else
        raise Exception.new("unknown enum value for 'ProvisioningType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ProvisioningType?
      case key
      when "NON_PROVISIONABLE" then ACF::ProvisioningType::NonProvisionable
      when "IMMUTABLE"         then ACF::ProvisioningType::Immutable
      when "FULLY_MUTABLE"     then ACF::ProvisioningType::FullyMutable
      else
        nil
      end
    end
  end
end
