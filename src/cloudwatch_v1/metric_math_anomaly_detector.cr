module Amazonite::CloudWatchV1
  class MetricMathAnomalyDetector
    include JSON::Serializable

    @[JSON::Field(key: "MetricDataQueries")]
    property metric_data_queries : Array(MetricDataQuery) | Nil

    def initialize(
      @metric_data_queries : Array(MetricDataQuery) | Nil = nil,
    )
    end
  end
end
