module Amazonite::CloudWatchV1
  # This object contains the information for one metric that is to be streamed with additional
  # statistics.
  class MetricStreamStatisticsMetric
    include JSON::Serializable

    # The namespace of the metric.
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The name of the metric.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    def initialize(
      @namespace : String,
      @metric_name : String,
    )
    end
  end
end
