module Amazonite::LambdaV1
  # Configuration options for a durable execution context.
  class ContextOptions
    include JSON::Serializable

    # Whether the state data of children of the completed context should be included in the invoke
    # payload and `GetDurableExecutionState` response.
    @[JSON::Field(key: "ReplayChildren")]
    property replay_children : Bool | Nil

    def initialize(
      @replay_children : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@replay_children)
  end
end
