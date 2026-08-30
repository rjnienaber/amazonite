module Amazonite::LambdaV1
  class GetFunctionConcurrencyResponse
    include JSON::Serializable

    # The number of simultaneous executions that are reserved for the function.
    @[JSON::Field(key: "ReservedConcurrentExecutions")]
    property reserved_concurrent_executions : Int32 | Nil

    def initialize(
      @reserved_concurrent_executions : Int32 | Nil = nil,
    )
    end
  end
end
