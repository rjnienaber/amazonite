module Amazonite::CloudWatchV1
  class DescribeAlarmsForMetricOutput
    include JSON::Serializable

    @[JSON::Field(key: "MetricAlarms")]
    property metric_alarms : Array(MetricAlarm) | Nil

    def initialize(
      @metric_alarms : Array(MetricAlarm) | Nil = nil,
    )
    end
  end
end
