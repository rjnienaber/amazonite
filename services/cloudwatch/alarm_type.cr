private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum AlarmType
    CompositeAlarm
    MetricAlarm
    LogAlarm

    def self.to_json(e : AlarmType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AlarmType
      value = pull.read_string
      case value
      when "CompositeAlarm" then ACW::AlarmType::CompositeAlarm
      when "MetricAlarm"    then ACW::AlarmType::MetricAlarm
      when "LogAlarm"       then ACW::AlarmType::LogAlarm
      else
        raise Exception.new("unknown enum value for 'AlarmType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::AlarmType?
      case key
      when "CompositeAlarm" then ACW::AlarmType::CompositeAlarm
      when "MetricAlarm"    then ACW::AlarmType::MetricAlarm
      when "LogAlarm"       then ACW::AlarmType::LogAlarm
      else
        nil
      end
    end
  end
end
