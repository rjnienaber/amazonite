private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum NodeTypeName
    Instance

    def self.to_json(e : NodeTypeName, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NodeTypeName
      value = pull.read_string
      case value
      when "Instance" then AS::NodeTypeName::Instance
      else
        raise Exception.new("unknown enum value for 'NodeTypeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::NodeTypeName?
      case key
      when "Instance" then AS::NodeTypeName::Instance
      else
        nil
      end
    end
  end
end
