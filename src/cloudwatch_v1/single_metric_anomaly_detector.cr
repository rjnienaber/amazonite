module Amazonite::CloudWatchV1
  class SingleMetricAnomalyDetector
    include JSON::Serializable

    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @stat : String | Nil = nil,
    )
    end
  end
end
