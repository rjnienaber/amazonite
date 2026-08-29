private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum ActionsSuppressedBy
    WaitPeriod
    ExtensionPeriod
    Alarm

    def self.to_json(e : ActionsSuppressedBy, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::ActionsSuppressedBy
      value = pull.read_string
      case value
      when "WaitPeriod"      then ACW::ActionsSuppressedBy::WaitPeriod
      when "ExtensionPeriod" then ACW::ActionsSuppressedBy::ExtensionPeriod
      when "Alarm"           then ACW::ActionsSuppressedBy::Alarm
      else
        raise Exception.new("unknown enum value for 'ActionsSuppressedBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::ActionsSuppressedBy?
      case key
      when "WaitPeriod"      then ACW::ActionsSuppressedBy::WaitPeriod
      when "ExtensionPeriod" then ACW::ActionsSuppressedBy::ExtensionPeriod
      when "Alarm"           then ACW::ActionsSuppressedBy::Alarm
      else
        nil
      end
    end
  end
end
