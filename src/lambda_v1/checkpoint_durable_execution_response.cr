module Amazonite::LambdaV1
  # The response from the CheckpointDurableExecution operation.
  class CheckpointDurableExecutionResponse
    include JSON::Serializable

    # A new checkpoint token to use for the next checkpoint operation. This token replaces the one
    # provided in the request and must be used for subsequent checkpoints to maintain proper ordering.
    @[JSON::Field(key: "CheckpointToken")]
    property checkpoint_token : String | Nil

    # Updated execution state information that includes any changes that occurred since the last
    # checkpoint, such as completed callbacks or expired timers. This allows the SDK to update its
    # internal state during replay.
    @[JSON::Field(key: "NewExecutionState")]
    property new_execution_state : CheckpointUpdatedExecutionState

    def initialize(
      @new_execution_state : CheckpointUpdatedExecutionState,
      @checkpoint_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@checkpoint_token, @new_execution_state)
  end
end
