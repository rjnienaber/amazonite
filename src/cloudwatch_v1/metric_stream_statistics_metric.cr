module Amazonite::CloudWatchV1
  class MetricStreamStatisticsMetric
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String

    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    def initialize(
      @namespace : String,
      @metric_name : String,
    )
    end
  end
end
