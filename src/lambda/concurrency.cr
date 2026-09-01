private alias Core = Amazonite::Core

module Amazonite::Lambda
  class Concurrency
    include JSON::Serializable

    # The number of concurrent executions that are reserved for this function. For more information,
    # see [Managing Lambda reserved
    # concurrency](https://docs.aws.amazon.com/lambda/latest/dg/configuration-concurrency.html).
    @[JSON::Field(key: "ReservedConcurrentExecutions")]
    property reserved_concurrent_executions : Int32 | Nil

    def initialize(
      @reserved_concurrent_executions : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @reserved_concurrent_executions
        raise Core::ValidationError.new("ReservedConcurrentExecutions value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@reserved_concurrent_executions)
  end
end
