private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum WarningType
    MutuallyExclusiveProperties
    UnsupportedProperties
    MutuallyExclusiveTypes
    ExcludedProperties
    ExcludedResources

    def self.to_json(e : WarningType, json : JSON::Builder) : Nil
      value = case e
              when ACF::WarningType::MutuallyExclusiveProperties then "MUTUALLY_EXCLUSIVE_PROPERTIES"
              when ACF::WarningType::UnsupportedProperties       then "UNSUPPORTED_PROPERTIES"
              when ACF::WarningType::MutuallyExclusiveTypes      then "MUTUALLY_EXCLUSIVE_TYPES"
              when ACF::WarningType::ExcludedProperties          then "EXCLUDED_PROPERTIES"
              when ACF::WarningType::ExcludedResources           then "EXCLUDED_RESOURCES"
              else
                raise Exception.new("unknown enum value for 'WarningType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::WarningType
      value = pull.read_string
      case value
      when "MUTUALLY_EXCLUSIVE_PROPERTIES" then ACF::WarningType::MutuallyExclusiveProperties
      when "UNSUPPORTED_PROPERTIES"        then ACF::WarningType::UnsupportedProperties
      when "MUTUALLY_EXCLUSIVE_TYPES"      then ACF::WarningType::MutuallyExclusiveTypes
      when "EXCLUDED_PROPERTIES"           then ACF::WarningType::ExcludedProperties
      when "EXCLUDED_RESOURCES"            then ACF::WarningType::ExcludedResources
      else
        raise Exception.new("unknown enum value for 'WarningType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::WarningType::MutuallyExclusiveProperties then "MUTUALLY_EXCLUSIVE_PROPERTIES"
      when ACF::WarningType::UnsupportedProperties       then "UNSUPPORTED_PROPERTIES"
      when ACF::WarningType::MutuallyExclusiveTypes      then "MUTUALLY_EXCLUSIVE_TYPES"
      when ACF::WarningType::ExcludedProperties          then "EXCLUDED_PROPERTIES"
      when ACF::WarningType::ExcludedResources           then "EXCLUDED_RESOURCES"
      else
        raise Exception.new("unknown enum value for 'WarningType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::WarningType?
      case key
      when "MUTUALLY_EXCLUSIVE_PROPERTIES" then ACF::WarningType::MutuallyExclusiveProperties
      when "UNSUPPORTED_PROPERTIES"        then ACF::WarningType::UnsupportedProperties
      when "MUTUALLY_EXCLUSIVE_TYPES"      then ACF::WarningType::MutuallyExclusiveTypes
      when "EXCLUDED_PROPERTIES"           then ACF::WarningType::ExcludedProperties
      when "EXCLUDED_RESOURCES"            then ACF::WarningType::ExcludedResources
      else
        nil
      end
    end
  end
end
