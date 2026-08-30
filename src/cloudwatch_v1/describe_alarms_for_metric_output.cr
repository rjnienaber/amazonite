private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAlarmsForMetricOutput
    include JSON::Serializable

    # The information for each alarm with the specified metric.
    @[JSON::Field(key: "MetricAlarms")]
    property metric_alarms : Array(MetricAlarm) | Nil

    def initialize(
      @metric_alarms : Array(MetricAlarm) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @metric_alarms
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_alarms)
  end
end
