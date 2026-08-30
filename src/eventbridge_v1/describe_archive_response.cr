private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeArchiveResponse
    include JSON::Serializable

    # The ARN of the archive.
    @[JSON::Field(key: "ArchiveArn")]
    property archive_arn : String | Nil

    # The name of the archive.
    @[JSON::Field(key: "ArchiveName")]
    property archive_name : String | Nil

    # The ARN of the event source associated with the archive.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # The description of the archive.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The event pattern used to filter events sent to the archive.
    @[JSON::Field(key: "EventPattern")]
    property event_pattern : String | Nil

    # The state of the archive.
    @[JSON::Field(key: "State", converter: AEB::ArchiveState)]
    property state : ArchiveState | Nil

    # The reason that the archive is in the state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The identifier of the KMS customer managed key for EventBridge to use to encrypt this archive,
    # if one has been specified.
    #
    # For more information, see [Encrypting
    # archives](https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html) in
    # the *Amazon EventBridge User Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    # The number of days to retain events for in the archive.
    @[JSON::Field(key: "RetentionDays")]
    property retention_days : Int32 | Nil

    # The size of the archive in bytes.
    @[JSON::Field(key: "SizeBytes")]
    property size_bytes : Int64 | Nil

    # The number of events in the archive.
    @[JSON::Field(key: "EventCount")]
    property event_count : Int64 | Nil

    # The time at which the archive was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    def initialize(
      @archive_arn : String | Nil = nil,
      @archive_name : String | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @event_pattern : String | Nil = nil,
      @state : ArchiveState | Nil = nil,
      @state_reason : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @retention_days : Int32 | Nil = nil,
      @size_bytes : Int64 | Nil = nil,
      @event_count : Int64 | Nil = nil,
      @creation_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @archive_arn
        raise Core::ValidationError.new("ArchiveArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ArchiveArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ArchiveArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @archive_name
        raise Core::ValidationError.new("ArchiveName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ArchiveName length must be <= 48") if value.size > 48
        raise Core::ValidationError.new("ArchiveName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventSourceArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @event_pattern
        raise Core::ValidationError.new("EventPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventPattern length must be <= 4096") if value.size > 4096
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end

      if value = @retention_days
        raise Core::ValidationError.new("RetentionDays value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@archive_arn, @archive_name, @event_source_arn, @description, @event_pattern, @state, @state_reason, @kms_key_identifier, @retention_days, @size_bytes, @event_count, @creation_time)
  end
end
