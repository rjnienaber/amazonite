private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ParameterType
    String
    StringList
    SecureString

    def self.to_json(e : ParameterType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ParameterType
      value = pull.read_string
      case value
      when "String"       then AS::ParameterType::String
      when "StringList"   then AS::ParameterType::StringList
      when "SecureString" then AS::ParameterType::SecureString
      else
        raise Exception.new("unknown enum value for 'ParameterType' when deserializing from json: '#{value}'")
      end
    end
  end
end
