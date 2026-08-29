module Amazonite::LambdaV1
  class PutFunctionConcurrencyRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "ReservedConcurrentExecutions")]
    property reserved_concurrent_executions : Int32

    def initialize(
      @function_name : String,
      @reserved_concurrent_executions : Int32,
    )
    end
  end
end
