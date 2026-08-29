module Amazonite::LambdaV1
  class SelfManagedKafkaEventSourceConfig
    include JSON::Serializable

    @[JSON::Field(key: "ConsumerGroupId")]
    property consumer_group_id : String | Nil

    @[JSON::Field(key: "SchemaRegistryConfig")]
    property schema_registry_config : KafkaSchemaRegistryConfig | Nil

    def initialize(
      @consumer_group_id : String | Nil = nil,
      @schema_registry_config : KafkaSchemaRegistryConfig | Nil = nil,
    )
    end
  end
end
