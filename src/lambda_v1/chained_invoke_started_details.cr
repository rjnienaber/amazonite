module Amazonite::LambdaV1
  class ChainedInvokeStartedDetails
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    @[JSON::Field(key: "Input")]
    property input : EventInput | Nil

    @[JSON::Field(key: "ExecutedVersion")]
    property executed_version : String | Nil

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
