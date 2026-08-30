private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ChangeType
    Resource

    def self.to_json(e : ChangeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeType
      value = pull.read_string
      case value
      when "Resource" then ACF::ChangeType::Resource
      else
        raise Exception.new("unknown enum value for 'ChangeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeType?
      case key
      when "Resource" then ACF::ChangeType::Resource
      else
        nil
      end
    end
  end
end
