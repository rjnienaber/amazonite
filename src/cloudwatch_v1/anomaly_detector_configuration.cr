module Amazonite::CloudWatchV1
  class AnomalyDetectorConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "ExcludedTimeRanges")]
    property excluded_time_ranges : Array(Range) | Nil

    @[JSON::Field(key: "MetricTimezone")]
    property metric_timezone : String | Nil

    def initialize(
      @excluded_time_ranges : Array(Range) | Nil = nil,
      @metric_timezone : String | Nil = nil,
    )
    end
  end
end
