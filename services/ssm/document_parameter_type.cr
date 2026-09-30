private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DocumentParameterType
    String
    StringList

    def self.to_json(e : DocumentParameterType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentParameterType
      value = pull.read_string
      case value
      when "String"     then AS::DocumentParameterType::String
      when "StringList" then AS::DocumentParameterType::StringList
      else
        raise Exception.new("unknown enum value for 'DocumentParameterType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DocumentParameterType?
      case key
      when "String"     then AS::DocumentParameterType::String
      when "StringList" then AS::DocumentParameterType::StringList
      else
        nil
      end
    end
  end
end
