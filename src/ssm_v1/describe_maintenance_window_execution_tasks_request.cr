private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTasksRequest
    include JSON::Serializable

    # The ID of the maintenance window execution whose task executions should be retrieved.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    # Optional filters used to scope down the returned tasks. The supported filter key is `STATUS`
    # with the corresponding values `PENDING`, `IN_PROGRESS`, `SUCCESS`, `FAILED`, `TIMED_OUT`,
    # `CANCELLING`, and `CANCELLED`.
    @[JSON::Field(key: "Filters")]
    property filters : Array(MaintenanceWindowFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_execution_id : String,
      @filters : Array(MaintenanceWindowFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_execution_id
        raise Core::ValidationError.new("WindowExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowExecutionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 10") if value < 10
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@window_execution_id, @filters, @max_results, @next_token)
  end
end
