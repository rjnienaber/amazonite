module Amazonite::CloudWatchV1
  class MetricStreamStatisticsConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "IncludeMetrics")]
    property include_metrics : Array(MetricStreamStatisticsMetric) = [] of MetricStreamStatisticsMetric

    @[JSON::Field(key: "AdditionalStatistics")]
    property additional_statistics : Array(String) = [] of String

    def initialize(
      @include_metrics : Array(MetricStreamStatisticsMetric),
      @additional_statistics : Array(String),
    )
    end
  end
end
