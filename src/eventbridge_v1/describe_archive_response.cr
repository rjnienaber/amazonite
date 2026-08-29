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
  end
end
