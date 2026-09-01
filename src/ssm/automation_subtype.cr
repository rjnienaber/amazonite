private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum AutomationSubtype
    ChangeRequest
    AccessRequest

    def self.to_json(e : AutomationSubtype, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AutomationSubtype
      value = pull.read_string
      case value
      when "ChangeRequest" then AS::AutomationSubtype::ChangeRequest
      when "AccessRequest" then AS::AutomationSubtype::AccessRequest
      else
        raise Exception.new("unknown enum value for 'AutomationSubtype' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AutomationSubtype?
      case key
      when "ChangeRequest" then AS::AutomationSubtype::ChangeRequest
      when "AccessRequest" then AS::AutomationSubtype::AccessRequest
      else
        nil
      end
    end
  end
end
