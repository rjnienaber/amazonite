module Amazonite::LambdaV1
  class CheckpointDurableExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    @[JSON::Field(key: "CheckpointToken")]
    property checkpoint_token : String

    @[JSON::Field(key: "Updates")]
    property updates : Array(OperationUpdate) | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @durable_execution_arn : String,
      @checkpoint_token : String,
      @updates : Array(OperationUpdate) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end
  end
end
