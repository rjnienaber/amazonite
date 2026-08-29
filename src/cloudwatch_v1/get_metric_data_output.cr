module Amazonite::CloudWatchV1
  class GetMetricDataOutput
    include JSON::Serializable

    @[JSON::Field(key: "MetricDataResults")]
    property metric_data_results : Array(MetricDataResult) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Messages")]
    property messages : Array(MessageData) | Nil

    def initialize(
      @metric_data_results : Array(MetricDataResult) | Nil = nil,
      @next_token : String | Nil = nil,
      @messages : Array(MessageData) | Nil = nil,
    )
    end
  end
end
