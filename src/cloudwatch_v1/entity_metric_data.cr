module Amazonite::CloudWatchV1
  class EntityMetricData
    include JSON::Serializable

    @[JSON::Field(key: "Entity")]
    property entity : Entity | Nil

    @[JSON::Field(key: "MetricData")]
    property metric_data : Array(MetricDatum) | Nil

    def initialize(
      @entity : Entity | Nil = nil,
      @metric_data : Array(MetricDatum) | Nil = nil,
    )
    end
  end
end
