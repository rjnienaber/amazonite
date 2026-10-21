private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    # The speed at which the anomaly detection model adapts to sustained changes in the metric's
    # baseline. Faster adaptation lets the model track shifting workloads sooner, but increases the
    # chance that the model treats a real, lasting change as normal.
    #
    # Valid values:
    #
    # - `FAST` - The model adapts quickly to sustained changes in the baseline.
    #
    # - `NORMAL` - The model adapts at a moderate pace. This is the default value.
    #
    # - `SLOW` - The model adapts slowly, reducing the risk of treating a real change as normal.
    @[JSON::Field(key: "AdaptationSpeed", converter: ACW::AnomalyDetectorAdaptationSpeed)]
    property adaptation_speed : AnomalyDetectorAdaptationSpeed | Nil

    # The aggressiveness with which CloudWatch filters outliers from the metric data that the anomaly
    # detection model uses. Stronger filtering excludes more extreme values, which can produce a
    # tighter band of expected values but may also suppress legitimate spikes.
    #
    # Valid values:
    #
    # - `MINIMAL` - Excludes only the most extreme outliers.
    #
    # - `MODERATE` - Excludes a moderate range of outliers. This is the default value.
    #
    # - `STRICT` - Excludes a wider range of outliers, which can suppress legitimate spikes.
    @[JSON::Field(key: "OutlierFilteringStrength", converter: ACW::AnomalyDetectorOutlierFilteringStrength)]
    property outlier_filtering_strength : AnomalyDetectorOutlierFilteringStrength | Nil

    def initialize(
      @excluded_time_ranges : Array(Range) | Nil = nil,
      @metric_timezone : String | Nil = nil,
      @adaptation_speed : AnomalyDetectorAdaptationSpeed | Nil = nil,
      @outlier_filtering_strength : AnomalyDetectorOutlierFilteringStrength | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @excluded_time_ranges
        value.each(&.validate!)
      end

      if value = @metric_timezone
        raise Core::ValidationError.new("MetricTimezone length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("MetricTimezone length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("MetricTimezone does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@excluded_time_ranges, @metric_timezone, @adaptation_speed, @outlier_filtering_strength)
  end
end
