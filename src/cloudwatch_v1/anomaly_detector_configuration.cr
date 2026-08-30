module Amazonite::CloudWatchV1
  # The configuration specifies details about how the anomaly detection model is to be trained,
  # including time ranges to exclude from use for training the model and the time zone to use for
  # the metric.
  class AnomalyDetectorConfiguration
    include JSON::Serializable

    # An array of time ranges to exclude from use when the anomaly detection model is trained. Use
    # this to make sure that events that could cause unusual values for the metric, such as
    # deployments, aren't used when CloudWatch creates the model.
    @[JSON::Field(key: "ExcludedTimeRanges")]
    property excluded_time_ranges : Array(Range) | Nil

    # The time zone to use for the metric. This is useful to enable the model to automatically account
    # for daylight savings time changes if the metric is sensitive to such time changes.
    #
    # To specify a time zone, use the name of the time zone as specified in the standard tz database.
    # For more information, see [tz database](https://en.wikipedia.org/wiki/Tz_database).
    @[JSON::Field(key: "MetricTimezone")]
    property metric_timezone : String | Nil

    def initialize(
      @excluded_time_ranges : Array(Range) | Nil = nil,
      @metric_timezone : String | Nil = nil,
    )
    end

    def_equals_and_hash(@excluded_time_ranges, @metric_timezone)
  end
end
