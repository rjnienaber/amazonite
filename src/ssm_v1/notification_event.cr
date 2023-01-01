private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum NotificationEvent
    All
    InProgress
    Success
    TimedOut
    Cancelled
    Failed

    def self.to_json(e : NotificationEvent, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NotificationEvent
      value = pull.read_string
      case value
      when "All"        then AS::NotificationEvent::All
      when "InProgress" then AS::NotificationEvent::InProgress
      when "Success"    then AS::NotificationEvent::Success
      when "TimedOut"   then AS::NotificationEvent::TimedOut
      when "Cancelled"  then AS::NotificationEvent::Cancelled
      when "Failed"     then AS::NotificationEvent::Failed
      else
        raise Exception.new("unknown enum value for 'NotificationEvent' when deserializing from json: '#{value}'")
      end
    end
  end
end
