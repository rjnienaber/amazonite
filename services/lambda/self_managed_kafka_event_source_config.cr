private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Specific configuration settings for a self-managed Apache Kafka event source.
  class SelfManagedKafkaEventSourceConfig
    include JSON::Serializable

    # The identifier for the Kafka consumer group to join. The consumer group ID must be unique among
    # all your Kafka event sources. After creating a Kafka event source mapping with the consumer
    # group ID specified, you cannot update this value. For more information, see [Customizable
    # consumer group
    # ID](https://docs.aws.amazon.com/lambda/latest/dg/with-kafka-process.html#services-smaa-topic-add).
    @[JSON::Field(key: "ConsumerGroupId")]
    property consumer_group_id : String | Nil

    # Specific configuration settings for a Kafka schema registry.
    @[JSON::Field(key: "SchemaRegistryConfig")]
    property schema_registry_config : KafkaSchemaRegistryConfig | Nil

    # The mode that Lambda uses to consume records from your self-managed Apache Kafka topic. The
    # default is `Stream`.
    #
    # - `Stream` – Lambda consumes records using a Kafka consumer group and preserves the order of
    # records within each partition. This is the default when you omit `ConsumptionMode`.
    #
    # - `Queue` – Lambda consumes records using a Kafka share group. Multiple consumers can process
    # records from the same partitions concurrently. Queue mode does not preserve per-partition order.
    # Queue mode requires an Apache Kafka cluster running version 4.2 or later with share groups
    # enabled.
    #
    # You cannot change `ConsumptionMode` after you create the event source mapping. To use a
    # different consumption mode, create a new event source mapping.
    #
    # When `ConsumptionMode` is `Queue`, the `StartingPosition`, `StartingPositionTimestamp`, and
    # `MaximumBatchingWindowInSeconds` parameters are not supported.
    @[JSON::Field(key: "ConsumptionMode", converter: AL::KafkaEventSourceMappingConsumptionMode)]
    property consumption_mode : KafkaEventSourceMappingConsumptionMode | Nil

    def initialize(
      @consumer_group_id : String | Nil = nil,
      @schema_registry_config : KafkaSchemaRegistryConfig | Nil = nil,
      @consumption_mode : KafkaEventSourceMappingConsumptionMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @consumer_group_id
        raise Core::ValidationError.new("ConsumerGroupId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConsumerGroupId length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("ConsumerGroupId does not match the required pattern") unless value.matches?(Regex.new("^[ a-zA-Z0-9-\\/*:_+=.@-]*$"))
      end

      if value = @schema_registry_config
        value.validate!
      end
    end

    def_equals_and_hash(@consumer_group_id, @schema_registry_config, @consumption_mode)
  end
end
