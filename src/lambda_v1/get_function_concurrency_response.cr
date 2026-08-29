module Amazonite::LambdaV1
  class GetFunctionConcurrencyResponse
    include JSON::Serializable

    @[JSON::Field(key: "ReservedConcurrentExecutions")]
    property reserved_concurrent_executions : Int32 | Nil

    def initialize(
      @reserved_concurrent_executions : Int32 | Nil = nil,
    )
    end
  end
end
