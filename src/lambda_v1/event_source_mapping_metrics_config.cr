private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class EventSourceMappingMetricsConfig
    include JSON::Serializable

    @[JSON::Field(key: "Metrics", converter: Core::ArrayConverter(AL::EventSourceMappingMetric))]
    property metrics : Array(EventSourceMappingMetric) | Nil

    def initialize(
      @metrics : Array(EventSourceMappingMetric) | Nil = nil,
    )
    end
  end
end
