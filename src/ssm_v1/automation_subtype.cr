private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AutomationSubtype
    ChangeRequest

    def self.to_json(e : AutomationSubtype, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AutomationSubtype
      value = pull.read_string
      case value
      when "ChangeRequest" then AS::AutomationSubtype::ChangeRequest
      else
        raise Exception.new("unknown enum value for 'AutomationSubtype' when deserializing from json: '#{value}'")
      end
    end
  end
end
