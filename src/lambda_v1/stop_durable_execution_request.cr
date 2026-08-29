module Amazonite::LambdaV1
  class StopDurableExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @durable_execution_arn : String,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
