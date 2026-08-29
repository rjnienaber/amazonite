module Amazonite::LambdaV1
  # Contains details about a chained function invocation that has started execution, including start
  # time and execution context.
  class ChainedInvokeStartedDetails
    include JSON::Serializable

    # The name or ARN of the Lambda function being invoked.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    # The tenant identifier for the chained invocation.
    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    # The JSON input payload provided to the chained invocation.
    @[JSON::Field(key: "Input")]
    property input : EventInput | Nil

    # The version of the function that was executed.
    @[JSON::Field(key: "ExecutedVersion")]
    property executed_version : String | Nil

    # The Amazon Resource Name (ARN) that identifies the durable execution.
    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String | Nil

    def initialize(
      @function_name : String,
      @tenant_id : String | Nil = nil,
      @input : EventInput | Nil = nil,
      @executed_version : String | Nil = nil,
      @durable_execution_arn : String | Nil = nil,
    )
    end
  end
end
