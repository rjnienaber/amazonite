module Amazonite::CloudWatchV1
  class MetricStreamFilter
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricNames")]
    property metric_names : Array(String) | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_names : Array(String) | Nil = nil,
    )
    end
  end
end
