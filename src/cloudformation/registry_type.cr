private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum RegistryType
    Resource
    Module
    Hook

    def self.to_json(e : RegistryType, json : JSON::Builder) : Nil
      value = case e
              when ACF::RegistryType::Resource then "RESOURCE"
              when ACF::RegistryType::Module   then "MODULE"
              when ACF::RegistryType::Hook     then "HOOK"
              else
                raise Exception.new("unknown enum value for 'RegistryType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::RegistryType
      value = pull.read_string
      case value
      when "RESOURCE" then ACF::RegistryType::Resource
      when "MODULE"   then ACF::RegistryType::Module
      when "HOOK"     then ACF::RegistryType::Hook
      else
        raise Exception.new("unknown enum value for 'RegistryType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::RegistryType::Resource then "RESOURCE"
      when ACF::RegistryType::Module   then "MODULE"
      when ACF::RegistryType::Hook     then "HOOK"
      else
        raise Exception.new("unknown enum value for 'RegistryType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::RegistryType?
      case key
      when "RESOURCE" then ACF::RegistryType::Resource
      when "MODULE"   then ACF::RegistryType::Module
      when "HOOK"     then ACF::RegistryType::Hook
      else
        nil
      end
    end
  end
end
