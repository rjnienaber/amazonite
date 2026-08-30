private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Represents a specific metric.
  class Metric
    include JSON::Serializable

    # The namespace of the metric.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The name of the metric. This is a required field.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The dimensions for the metric.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
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

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Dimensions must have at most 30 item(s)") if value.size > 30
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@namespace, @metric_name, @dimensions)
  end
end
