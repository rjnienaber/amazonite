module Amazonite::LambdaV1
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

    def initialize(
      @consumer_group_id : String | Nil = nil,
      @schema_registry_config : KafkaSchemaRegistryConfig | Nil = nil,
    )
    end

    def_equals_and_hash(@consumer_group_id, @schema_registry_config)
  end
end
