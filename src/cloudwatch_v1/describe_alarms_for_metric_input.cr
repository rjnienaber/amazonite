private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class DescribeAlarmsForMetricInput
    include JSON::Serializable

    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    @[JSON::Field(key: "Namespace")]
    property namespace : String

    @[JSON::Field(key: "Statistic", converter: ACW::Statistic)]
    property statistic : Statistic | Nil

    @[JSON::Field(key: "ExtendedStatistic")]
    property extended_statistic : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Period")]
    property period : Int32 | Nil

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
