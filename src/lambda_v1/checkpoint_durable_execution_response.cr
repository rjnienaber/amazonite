private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @checkpoint_token
        raise Core::ValidationError.new("CheckpointToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CheckpointToken length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("CheckpointToken does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9+/]+={0,2}$"))
      end

      if value = @new_execution_state
        value.validate!
      end
    end

    def_equals_and_hash(@checkpoint_token, @new_execution_state)
  end
end
