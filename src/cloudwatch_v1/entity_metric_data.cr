module Amazonite::CloudWatchV1
  # A set of metrics that are associated with an entity, such as a specific service or resource.
  # Contains the entity and the list of metric data associated with it.
  class EntityMetricData
    include JSON::Serializable

    # The entity associated with the metrics.
    @[JSON::Field(key: "Entity")]
    property entity : Entity | Nil

    # The metric data.
    @[JSON::Field(key: "MetricData")]
    property metric_data : Array(MetricDatum) | Nil

    def initialize(
      @entity : Entity | Nil = nil,
      @metric_data : Array(MetricDatum) | Nil = nil,
    )
    end
  end
end
