module Amazonite::CloudWatchV1
  class DescribeAlarmsOutput
    include JSON::Serializable

    @[JSON::Field(key: "CompositeAlarms")]
    property composite_alarms : Array(CompositeAlarm) | Nil

    @[JSON::Field(key: "MetricAlarms")]
    property metric_alarms : Array(MetricAlarm) | Nil

    @[JSON::Field(key: "LogAlarms")]
    property log_alarms : Array(LogAlarm) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @composite_alarms : Array(CompositeAlarm) | Nil = nil,
      @metric_alarms : Array(MetricAlarm) | Nil = nil,
      @log_alarms : Array(LogAlarm) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
