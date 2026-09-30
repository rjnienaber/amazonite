private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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

    def validate! : Nil
      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @metric_name
        raise Core::ValidationError.new("MetricName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MetricName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@namespace, @metric_name)
  end
end
