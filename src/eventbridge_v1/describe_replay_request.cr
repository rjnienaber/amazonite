private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeReplayRequest
    include JSON::Serializable

    # The name of the replay to retrieve.
    @[JSON::Field(key: "ReplayName")]
    property replay_name : String

    def initialize(
      @replay_name : String,
    )
    end

    def validate! : Nil
      if value = @replay_name
        raise Core::ValidationError.new("ReplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ReplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@replay_name)
  end
end
