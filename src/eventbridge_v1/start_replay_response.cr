private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class StartReplayResponse
    include JSON::Serializable

    # The ARN of the replay.
    @[JSON::Field(key: "ReplayArn")]
    property replay_arn : String | Nil

    # The state of the replay.
    @[JSON::Field(key: "State", converter: AEB::ReplayState)]
    property state : ReplayState | Nil

    # The reason that the replay is in the state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The time at which the replay started.
    @[JSON::Field(key: "ReplayStartTime", converter: Core::AWSEpochConverter)]
    property replay_start_time : Time | Nil

    def initialize(
      @replay_arn : String | Nil = nil,
      @state : ReplayState | Nil = nil,
      @state_reason : String | Nil = nil,
      @replay_start_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replay_arn
        raise Core::ValidationError.new("ReplayArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ReplayArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@replay_arn, @state, @state_reason, @replay_start_time)
  end
end
