private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class UpdateArchiveResponse
    include JSON::Serializable

    # The ARN of the archive.
    @[JSON::Field(key: "ArchiveArn")]
    property archive_arn : String | Nil

    # The state of the archive.
    @[JSON::Field(key: "State", converter: AEB::ArchiveState)]
    property state : ArchiveState | Nil

    # The reason that the archive is in the current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The time at which the archive was updated.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    def initialize(
      @archive_arn : String | Nil = nil,
      @state : ArchiveState | Nil = nil,
      @state_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@archive_arn, @state, @state_reason, @creation_time)
  end
end
