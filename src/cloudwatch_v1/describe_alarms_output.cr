private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmsOutput
    include JSON::Serializable

    # The information about any composite alarms returned by the operation.
    @[JSON::Field(key: "CompositeAlarms")]
    property composite_alarms : Array(CompositeAlarm) | Nil

    # The information about any metric alarms returned by the operation.
    @[JSON::Field(key: "MetricAlarms")]
    property metric_alarms : Array(MetricAlarm) | Nil

    # The information about any log alarms returned by the operation.
    @[JSON::Field(key: "LogAlarms")]
    property log_alarms : Array(LogAlarm) | Nil

    # The token that marks the start of the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @composite_alarms : Array(CompositeAlarm) | Nil = nil,
      @metric_alarms : Array(MetricAlarm) | Nil = nil,
      @log_alarms : Array(LogAlarm) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @composite_alarms
        value.each(&.validate!)
      end

      if value = @metric_alarms
        value.each(&.validate!)
      end

      if value = @log_alarms
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@composite_alarms, @metric_alarms, @log_alarms, @next_token)
  end
end
