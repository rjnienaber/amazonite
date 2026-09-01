private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Specific configuration settings for a Kafka schema registry.
  class KafkaSchemaRegistryConfig
    include JSON::Serializable

    # The URI for your schema registry. The correct URI format depends on the type of schema registry
    # you're using.
    #
    # - For Glue schema registries, use the ARN of the registry.
    #
    # - For Confluent schema registries, use the URL of the registry.
    @[JSON::Field(key: "SchemaRegistryURI")]
    property schema_registry_uri : String | Nil

    # The record format that Lambda delivers to your function after schema validation.
    #
    # - Choose `JSON` to have Lambda deliver the record to your function as a standard JSON object.
    #
    # - Choose `SOURCE` to have Lambda deliver the record to your function in its original source
    # format. Lambda removes all schema metadata, such as the schema ID, before sending the record to
    # your function.
    @[JSON::Field(key: "EventRecordFormat", converter: AL::SchemaRegistryEventRecordFormat)]
    property event_record_format : SchemaRegistryEventRecordFormat | Nil

    # An array of access configuration objects that tell Lambda how to authenticate with your schema
    # registry.
    @[JSON::Field(key: "AccessConfigs")]
    property access_configs : Array(KafkaSchemaRegistryAccessConfig) | Nil

    # An array of schema validation configuration objects, which tell Lambda the message attributes
    # you want to validate and filter using your schema registry.
    @[JSON::Field(key: "SchemaValidationConfigs")]
    property schema_validation_configs : Array(KafkaSchemaValidationConfig) | Nil

    def initialize(
      @schema_registry_uri : String | Nil = nil,
      @event_record_format : SchemaRegistryEventRecordFormat | Nil = nil,
      @access_configs : Array(KafkaSchemaRegistryAccessConfig) | Nil = nil,
      @schema_validation_configs : Array(KafkaSchemaValidationConfig) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @schema_registry_uri
        raise Core::ValidationError.new("SchemaRegistryURI length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SchemaRegistryURI length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SchemaRegistryURI does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-\\/*:_+=.@-]*$"))
      end

      if value = @access_configs
        value.each(&.validate!)
      end

      if value = @schema_validation_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@schema_registry_uri, @event_record_format, @access_configs, @schema_validation_configs)
  end
end
