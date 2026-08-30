private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # An `Archive` object that contains details about an archive.
  class Archive
    include JSON::Serializable

    # The name of the archive.
    @[JSON::Field(key: "ArchiveName")]
    property archive_name : String | Nil

    # The ARN of the event bus associated with the archive. Only events from this event bus are sent
    # to the archive.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # The current state of the archive.
    @[JSON::Field(key: "State", converter: AEB::ArchiveState)]
    property state : ArchiveState | Nil

    # A description for the reason that the archive is in the current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The number of days to retain events in the archive before they are deleted.
    @[JSON::Field(key: "RetentionDays")]
    property retention_days : Int32 | Nil

    # The size of the archive, in bytes.
    @[JSON::Field(key: "SizeBytes")]
    property size_bytes : Int64 | Nil

    # The number of events in the archive.
    @[JSON::Field(key: "EventCount")]
    property event_count : Int64 | Nil

    # The time stamp for the time that the archive was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    def initialize(
      @archive_name : String | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @state : ArchiveState | Nil = nil,
      @state_reason : String | Nil = nil,
      @retention_days : Int32 | Nil = nil,
      @size_bytes : Int64 | Nil = nil,
      @event_count : Int64 | Nil = nil,
      @creation_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
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

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @retention_days
        raise Core::ValidationError.new("RetentionDays value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@archive_name, @event_source_arn, @state, @state_reason, @retention_days, @size_bytes, @event_count, @creation_time)
  end
end
