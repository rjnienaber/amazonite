private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ExternalAlarmState
    Unknown
    Alarm

    def self.to_json(e : ExternalAlarmState, json : JSON::Builder) : Nil
      value = case e
              when AS::ExternalAlarmState::Unknown then "UNKNOWN"
              when AS::ExternalAlarmState::Alarm   then "ALARM"
              else
                raise Exception.new("unknown enum value for 'ExternalAlarmState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExternalAlarmState
      value = pull.read_string
      case value
      when "UNKNOWN" then AS::ExternalAlarmState::Unknown
      when "ALARM"   then AS::ExternalAlarmState::Alarm
      else
        raise Exception.new("unknown enum value for 'ExternalAlarmState' when deserializing from json: '#{value}'")
      end
    end
  end
end
