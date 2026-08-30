module Amazonite::EventBridgeV1
  class UpdateEventBusRequest
    include JSON::Serializable

    # The name of the event bus.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
    # customer managed key to encrypt events on this event bus. The identifier can be the key Amazon
    # Resource Name (ARN), KeyId, key alias, or key alias ARN.
    #
    # If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services
    # owned key to encrypt events on the event bus.
    #
    # For more information, see [Identify and view
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html) in the *Key
    # Management Service Developer Guide*.
    #
    # Schema discovery is not supported for event buses encrypted using a customer managed key.
    # EventBridge returns an error if:
    #
    # - You call `
    # [CreateDiscoverer](https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer)
    # ` on an event bus set to use a customer managed key for encryption.
    #
    # - You call `
    # [UpdatedEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html)
    # ` to set a customer managed key on an event bus with schema discovery enabled.
    #
    # To enable schema discovery on an event bus, choose to use an Amazon Web Services owned key. For
    # more information, see [Encrypting
    # events](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption-event-bus-cmkey.html)
    # in the *Amazon EventBridge User Guide*.
    #
    # If you have specified that EventBridge use a customer managed key for encrypting the source
    # event bus, we strongly recommend you also specify a customer managed key for any archives for
    # the event bus as well.
    #
    # For more information, see [Encrypting
    # archives](https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html) in
    # the *Amazon EventBridge User Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    # The event bus description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    # The logging configuration settings for the event bus.
    #
    # For more information, see [Configuring logs for event
    # buses](https://docs.aws.amazon.com/eb-event-bus-logs.html) in the *EventBridge User Guide*.
    @[JSON::Field(key: "LogConfig")]
    property log_config : LogConfig | Nil

    def initialize(
      @name : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @description : String | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @log_config : LogConfig | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @kms_key_identifier, @description, @dead_letter_config, @log_config)
  end
end
