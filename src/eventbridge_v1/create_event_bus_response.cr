private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class CreateEventBusResponse
    include JSON::Serializable

    # The ARN of the new event bus.
    @[JSON::Field(key: "EventBusArn")]
    property event_bus_arn : String | Nil

    # The event bus description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this
    # event bus, if one has been specified.
    #
    # For more information, see [Data encryption in
    # EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html) in the
    # *Amazon EventBridge User Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    # The logging configuration settings for the event bus.
    #
    # For more information, see [Configuring logs for event
    # buses](https://docs.aws.amazon.com/eb-event-bus-logs.html) in the *EventBridge User Guide*.
    @[JSON::Field(key: "LogConfig")]
    property log_config : LogConfig | Nil

    def initialize(
      @event_bus_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @log_config : LogConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end

      if value = @dead_letter_config
        value.validate!
      end

      if value = @log_config
        value.validate!
      end
    end

    def_equals_and_hash(@event_bus_arn, @description, @kms_key_identifier, @dead_letter_config, @log_config)
  end
end
