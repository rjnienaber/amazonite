private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # The response from the ListDurableExecutionsByFunction operation, containing a list of durable
  # executions and pagination information.
  class ListDurableExecutionsByFunctionResponse
    include JSON::Serializable

    # List of durable execution summaries matching the filter criteria.
    @[JSON::Field(key: "DurableExecutions")]
    property durable_executions : Array(Execution) | Nil

    # Pagination token for retrieving additional results. Present only if there are more results
    # available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @durable_executions : Array(Execution) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @durable_executions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@durable_executions, @next_marker)
  end
end
