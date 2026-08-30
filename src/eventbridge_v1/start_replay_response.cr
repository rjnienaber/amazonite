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

    def_equals_and_hash(@replay_arn, @state, @state_reason, @replay_start_time)
  end
end
