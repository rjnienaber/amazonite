private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricDataInput
    include JSON::Serializable

    @[JSON::Field(key: "MetricDataQueries")]
    property metric_data_queries : Array(MetricDataQuery) = [] of MetricDataQuery

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ScanBy", converter: ACW::ScanBy)]
    property scan_by : ScanBy | Nil

    @[JSON::Field(key: "MaxDatapoints")]
    property max_datapoints : Int32 | Nil

    @[JSON::Field(key: "LabelOptions")]
    property label_options : LabelOptions | Nil

    def initialize(
      @metric_data_queries : Array(MetricDataQuery),
      @start_time : Time,
      @end_time : Time,
      @next_token : String | Nil = nil,
      @scan_by : ScanBy | Nil = nil,
      @max_datapoints : Int32 | Nil = nil,
      @label_options : LabelOptions | Nil = nil,
    )
    end
  end
end
