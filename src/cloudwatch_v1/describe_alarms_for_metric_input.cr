private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class DescribeAlarmsForMetricInput
    include JSON::Serializable

    # The name of the metric.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    # The namespace of the metric.
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The statistic for the metric, other than percentiles. For percentile statistics, use
    # `ExtendedStatistics`.
    @[JSON::Field(key: "Statistic", converter: ACW::Statistic)]
    property statistic : Statistic | Nil

    # The percentile statistic for the metric. Specify a value between p0.0 and p100.
    @[JSON::Field(key: "ExtendedStatistic")]
    property extended_statistic : String | Nil

    # The dimensions associated with the metric. If the metric has any associated dimensions, you must
    # specify them in order for the call to succeed.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The period, in seconds, over which the statistic is applied.
    @[JSON::Field(key: "Period")]
    property period : Int32 | Nil

    # The unit for the metric.
    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @metric_name : String,
      @namespace : String,
      @statistic : Statistic | Nil = nil,
      @extended_statistic : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @period : Int32 | Nil = nil,
      @unit : StandardUnit | Nil = nil,
    )
    end
  end
end
