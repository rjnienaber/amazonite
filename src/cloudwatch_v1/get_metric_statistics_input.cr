private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricStatisticsInput
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String

    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    @[JSON::Field(key: "Period")]
    property period : Int32

    @[JSON::Field(key: "Statistics", converter: Core::ArrayConverter(ACW::Statistic))]
    property statistics : Array(Statistic) | Nil

    @[JSON::Field(key: "ExtendedStatistics")]
    property extended_statistics : Array(String) | Nil

    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @namespace : String,
      @metric_name : String,
      @start_time : Time,
      @end_time : Time,
      @period : Int32,
      @dimensions : Array(Dimension) | Nil = nil,
      @statistics : Array(Statistic) | Nil = nil,
      @extended_statistics : Array(String) | Nil = nil,
      @unit : StandardUnit | Nil = nil,
    )
    end
  end
end
