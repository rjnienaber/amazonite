private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ThirdPartyType
    Resource
    Module
    Hook

    def self.to_json(e : ThirdPartyType, json : JSON::Builder) : Nil
      value = case e
              when ACF::ThirdPartyType::Resource then "RESOURCE"
              when ACF::ThirdPartyType::Module   then "MODULE"
              when ACF::ThirdPartyType::Hook     then "HOOK"
              else
                raise Exception.new("unknown enum value for 'ThirdPartyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ThirdPartyType
      value = pull.read_string
      case value
      when "RESOURCE" then ACF::ThirdPartyType::Resource
      when "MODULE"   then ACF::ThirdPartyType::Module
      when "HOOK"     then ACF::ThirdPartyType::Hook
      else
        raise Exception.new("unknown enum value for 'ThirdPartyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ThirdPartyType::Resource then "RESOURCE"
      when ACF::ThirdPartyType::Module   then "MODULE"
      when ACF::ThirdPartyType::Hook     then "HOOK"
      else
        raise Exception.new("unknown enum value for 'ThirdPartyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ThirdPartyType?
      case key
      when "RESOURCE" then ACF::ThirdPartyType::Resource
      when "MODULE"   then ACF::ThirdPartyType::Module
      when "HOOK"     then ACF::ThirdPartyType::Hook
      else
        nil
      end
    end
  end
end
