module Amazonite::LambdaV1
  # Configuration options for chained function invocations in durable executions, including retry
  # settings and timeout configuration.
  class ChainedInvokeOptions
    include JSON::Serializable

    # The name or ARN of the Lambda function to invoke.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    # The tenant identifier for the chained invocation.
    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    def initialize(
      @function_name : String,
      @tenant_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@function_name, @tenant_id)
  end
end
