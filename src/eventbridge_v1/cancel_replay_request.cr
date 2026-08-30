module Amazonite::EventBridgeV1
  class CancelReplayRequest
    include JSON::Serializable

    # The name of the replay to cancel.
    @[JSON::Field(key: "ReplayName")]
    property replay_name : String

    def initialize(
      @replay_name : String,
    )
    end

    def_equals_and_hash(@replay_name)
  end
end
