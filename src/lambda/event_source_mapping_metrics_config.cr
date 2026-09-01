private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The metrics configuration for your event source. Use this configuration object to define which
  # metrics you want your event source mapping to produce.
  class EventSourceMappingMetricsConfig
    include JSON::Serializable

    # The metrics you want your event source mapping to produce, including `EventCount`, `ErrorCount`,
    # `KafkaMetrics`.
    #
    # - `EventCount` to receive metrics related to the number of events processed by your event source
    # mapping.
    #
    # - `ErrorCount` (Amazon MSK and self-managed Apache Kafka) to receive metrics related to the
    # number of errors in your event source mapping processing.
    #
    # - `KafkaMetrics` (Amazon MSK and self-managed Apache Kafka) to receive metrics related to the
    # Kafka consumers from your event source mapping.
    #
    # For more information about these metrics, see [ Event source mapping
    # metrics](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics).
    @[JSON::Field(key: "Metrics", converter: Core::ArrayConverter(AL::EventSourceMappingMetric))]
    property metrics : Array(EventSourceMappingMetric) | Nil

    def initialize(
      @metrics : Array(EventSourceMappingMetric) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @metrics
        raise Core::ValidationError.new("Metrics must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Metrics must have at most 3 item(s)") if value.size > 3
      end
    end

    def_equals_and_hash(@metrics)
  end
end
