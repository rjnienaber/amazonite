module Amazonite::LambdaV1
  class ListDurableExecutionsByFunctionResponse
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutions")]
    property durable_executions : Array(Execution) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @durable_executions : Array(Execution) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
