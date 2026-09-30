private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @metric_name
        raise Core::ValidationError.new("MetricName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MetricName length must be <= 255") if value.size > 255
      end

      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Dimensions must have at most 30 item(s)") if value.size > 30
        value.each(&.validate!)
      end

      if value = @period
        raise Core::ValidationError.new("Period value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@metric_name, @namespace, @statistic, @extended_statistic, @dimensions, @period, @unit)
  end
end
