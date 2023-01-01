private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
