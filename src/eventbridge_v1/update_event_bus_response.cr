private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class UpdateEventBusResponse
    include JSON::Serializable

    # The event bus Amazon Resource Name (ARN).
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The event bus name.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this
    # event bus, if one has been specified.
    #
    # For more information, see [Data encryption in
    # EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html) in the
    # *Amazon EventBridge User Guide*.
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
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @description : String | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @log_config : LogConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[/\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
      end

      if value = @dead_letter_config
        value.validate!
      end

      if value = @log_config
        value.validate!
      end
    end

    def_equals_and_hash(@arn, @name, @kms_key_identifier, @description, @dead_letter_config, @log_config)
  end
end
