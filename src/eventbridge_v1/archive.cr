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

    def_equals_and_hash(@archive_name, @event_source_arn, @state, @state_reason, @retention_days, @size_bytes, @event_count, @creation_time)
  end
end
