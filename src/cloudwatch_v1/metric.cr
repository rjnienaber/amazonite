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
  end
end
