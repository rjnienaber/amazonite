private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class KafkaSchemaRegistryConfig
    include JSON::Serializable

    @[JSON::Field(key: "SchemaRegistryURI")]
    property schema_registry_uri : String | Nil

    @[JSON::Field(key: "EventRecordFormat", converter: AL::SchemaRegistryEventRecordFormat)]
    property event_record_format : SchemaRegistryEventRecordFormat | Nil

    @[JSON::Field(key: "AccessConfigs")]
    property access_configs : Array(KafkaSchemaRegistryAccessConfig) | Nil

    @[JSON::Field(key: "SchemaValidationConfigs")]
    property schema_validation_configs : Array(KafkaSchemaValidationConfig) | Nil

    def initialize(
      @schema_registry_uri : String | Nil = nil,
      @event_record_format : SchemaRegistryEventRecordFormat | Nil = nil,
      @access_configs : Array(KafkaSchemaRegistryAccessConfig) | Nil = nil,
      @schema_validation_configs : Array(KafkaSchemaValidationConfig) | Nil = nil,
    )
    end
  end
end
