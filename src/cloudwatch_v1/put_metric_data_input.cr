module Amazonite::CloudWatchV1
  class PutMetricDataInput
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String

    @[JSON::Field(key: "MetricData")]
    property metric_data : Array(MetricDatum) | Nil

    @[JSON::Field(key: "EntityMetricData")]
    property entity_metric_data : Array(EntityMetricData) | Nil

    @[JSON::Field(key: "StrictEntityValidation")]
    property strict_entity_validation : Bool | Nil

    def initialize(
      @namespace : String,
      @metric_data : Array(MetricDatum) | Nil = nil,
      @entity_metric_data : Array(EntityMetricData) | Nil = nil,
      @strict_entity_validation : Bool | Nil = nil,
    )
    end
  end
end
