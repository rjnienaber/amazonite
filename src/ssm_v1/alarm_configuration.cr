module Amazonite::SsmV1
  class AlarmConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "IgnorePollAlarmFailure")]
    property ignore_poll_alarm_failure : Bool | Nil

    @[JSON::Field(key: "Alarms")]
    property alarms : Array(Alarm)

    def initialize(
      @alarms : Array(Alarm),
      @ignore_poll_alarm_failure : Bool | Nil = nil
    )
    end
  end
end
