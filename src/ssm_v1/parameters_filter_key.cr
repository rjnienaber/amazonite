private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ParametersFilterKey
    Name
    Type
    KeyId

    def self.to_json(e : ParametersFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ParametersFilterKey
      value = pull.read_string
      case value
      when "Name"  then AS::ParametersFilterKey::Name
      when "Type"  then AS::ParametersFilterKey::Type
      when "KeyId" then AS::ParametersFilterKey::KeyId
      else
        raise Exception.new("unknown enum value for 'ParametersFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
