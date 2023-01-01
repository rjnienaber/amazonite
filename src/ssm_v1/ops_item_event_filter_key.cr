private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemEventFilterKey
    OpsItemId

    def self.to_json(e : OpsItemEventFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemEventFilterKey
      value = pull.read_string
      case value
      when "OpsItemId" then AS::OpsItemEventFilterKey::OpsItemId
      else
        raise Exception.new("unknown enum value for 'OpsItemEventFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
