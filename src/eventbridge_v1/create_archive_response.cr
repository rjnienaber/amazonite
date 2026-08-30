private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class CreateArchiveResponse
    include JSON::Serializable

    # The ARN of the archive that was created.
    @[JSON::Field(key: "ArchiveArn")]
    property archive_arn : String | Nil

    # The state of the archive that was created.
    @[JSON::Field(key: "State", converter: AEB::ArchiveState)]
    property state : ArchiveState | Nil

    # The reason that the archive is in the state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The time at which the archive was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    def initialize(
      @archive_arn : String | Nil = nil,
      @state : ArchiveState | Nil = nil,
      @state_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
    )
    end
  end
end
