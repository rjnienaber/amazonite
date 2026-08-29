module Amazonite::CloudWatchV1
  class Metric
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

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
