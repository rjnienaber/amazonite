private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum HookTargetType
    Resource

    def self.to_json(e : HookTargetType, json : JSON::Builder) : Nil
      value = case e
              when ACF::HookTargetType::Resource then "RESOURCE"
              else
                raise Exception.new("unknown enum value for 'HookTargetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HookTargetType
      value = pull.read_string
      case value
      when "RESOURCE" then ACF::HookTargetType::Resource
      else
        raise Exception.new("unknown enum value for 'HookTargetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::HookTargetType::Resource then "RESOURCE"
      else
        raise Exception.new("unknown enum value for 'HookTargetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::HookTargetType?
      case key
      when "RESOURCE" then ACF::HookTargetType::Resource
      else
        nil
      end
    end
  end
end
