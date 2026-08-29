module Amazonite::LambdaV1
  class CheckpointDurableExecutionResponse
    include JSON::Serializable

    @[JSON::Field(key: "CheckpointToken")]
    property checkpoint_token : String | Nil

    @[JSON::Field(key: "NewExecutionState")]
    property new_execution_state : CheckpointUpdatedExecutionState

    def initialize(
      @new_execution_state : CheckpointUpdatedExecutionState,
      @checkpoint_token : String | Nil = nil,
    )
    end
  end
end
