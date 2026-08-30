private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
  # event source.
  class AmazonManagedKafkaEventSourceConfig
    include JSON::Serializable

    # The identifier for the Kafka consumer group to join. The consumer group ID must be unique among
    # all your Kafka event sources. After creating a Kafka event source mapping with the consumer
    # group ID specified, you cannot update this value. For more information, see [Customizable
    # consumer group
    # ID](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-consumer-group-id).
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

    def_equals_and_hash(@consumer_group_id, @schema_registry_config)
  end
end
