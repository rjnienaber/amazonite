private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @archive_arn
        raise Core::ValidationError.new("ArchiveArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ArchiveArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ArchiveArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@archive_arn, @state, @state_reason, @creation_time)
  end
end
