module Amazonite::SsmV1
  # The details for the CloudWatch alarm you want to apply to an automation or command.
  class AlarmConfiguration
    include JSON::Serializable

    # When this value is *true*, your automation or command continues to run in cases where we can’t
    # retrieve alarm status information from CloudWatch. In cases where we successfully retrieve an
    # alarm status of OK or INSUFFICIENT_DATA, the automation or command continues to run, regardless
    # of this value. Default is *false*.
    @[JSON::Field(key: "IgnorePollAlarmFailure")]
    property ignore_poll_alarm_failure : Bool | Nil

    # The name of the CloudWatch alarm specified in the configuration.
    @[JSON::Field(key: "Alarms")]
    property alarms : Array(Alarm) = [] of Alarm

    def initialize(
      @alarms : Array(Alarm),
      @ignore_poll_alarm_failure : Bool | Nil = nil,
    )
    end
  end
end
