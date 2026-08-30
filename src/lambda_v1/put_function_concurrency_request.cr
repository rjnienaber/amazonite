module Amazonite::LambdaV1
  class PutFunctionConcurrencyRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The number of simultaneous executions to reserve for the function.
    @[JSON::Field(key: "ReservedConcurrentExecutions")]
    property reserved_concurrent_executions : Int32

    def initialize(
      @function_name : String,
      @reserved_concurrent_executions : Int32,
    )
    end

    def_equals_and_hash(@function_name, @reserved_concurrent_executions)
  end
end
