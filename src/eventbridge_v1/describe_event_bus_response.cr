private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeEventBusResponse
    include JSON::Serializable

    # The name of the event bus. Currently, this is always `default`.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) of the account permitted to write events to the current account.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

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

    # The policy that enables the external account to send events to your account.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # The logging configuration settings for the event bus.
    #
    # For more information, see [Configuring logs for event
    # buses](https://docs.aws.amazon.com/eb-event-bus-logs.html) in the *EventBridge User Guide*.
    @[JSON::Field(key: "LogConfig")]
    property log_config : LogConfig | Nil

    # The time the event bus was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The time the event bus was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @policy : String | Nil = nil,
      @log_config : LogConfig | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
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

    def_equals_and_hash(@name, @arn, @description, @kms_key_identifier, @dead_letter_config, @policy, @log_config, @creation_time, @last_modified_time)
  end
end
