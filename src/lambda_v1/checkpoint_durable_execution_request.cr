module Amazonite::LambdaV1
  class CheckpointDurableExecutionRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # A unique token that identifies the current checkpoint state. This token is provided by the
    # Lambda runtime and must be used to ensure checkpoints are applied in the correct order. Each
    # checkpoint operation consumes this token and returns a new one.
    @[JSON::Field(key: "CheckpointToken")]
    property checkpoint_token : String

    # An array of state updates to apply during this checkpoint. Each update represents a change to
    # the execution state, such as completing a step, starting a callback, or scheduling a timer.
    # Updates are applied atomically as part of the checkpoint operation.
    @[JSON::Field(key: "Updates")]
    property updates : Array(OperationUpdate) | Nil

    # An optional idempotency token to ensure that duplicate checkpoint requests are handled
    # correctly. If provided, Lambda uses this token to detect and handle duplicate requests within a
    # 15-minute window.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @durable_execution_arn : String,
      @checkpoint_token : String,
      @updates : Array(OperationUpdate) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@durable_execution_arn, @checkpoint_token, @updates, @client_token)
  end
end
