private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class CancelReplayResponse
    include JSON::Serializable

    # The ARN of the replay to cancel.
    @[JSON::Field(key: "ReplayArn")]
    property replay_arn : String | Nil

    # The current state of the replay.
    @[JSON::Field(key: "State", converter: AEB::ReplayState)]
    property state : ReplayState | Nil

    # The reason that the replay is in the current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    def initialize(
      @replay_arn : String | Nil = nil,
      @state : ReplayState | Nil = nil,
      @state_reason : String | Nil = nil,
    )
    end
  end
end
