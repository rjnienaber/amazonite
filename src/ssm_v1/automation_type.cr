private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AutomationType
    CrossAccount
    Local

    def self.to_json(e : AutomationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AutomationType
      value = pull.read_string
      case value
      when "CrossAccount" then AS::AutomationType::CrossAccount
      when "Local"        then AS::AutomationType::Local
      else
        raise Exception.new("unknown enum value for 'AutomationType' when deserializing from json: '#{value}'")
      end
    end
  end
end
