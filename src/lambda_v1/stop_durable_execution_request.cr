module Amazonite::LambdaV1
  class StopDurableExecutionRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # Optional error details explaining why the execution is being stopped.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @durable_execution_arn : String,
      @error : ErrorObject | Nil = nil,
    )
    end

    def_equals_and_hash(@durable_execution_arn, @error)
  end
end
