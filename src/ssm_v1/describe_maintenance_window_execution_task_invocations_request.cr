module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTaskInvocationsRequest
    include JSON::Serializable

    # The ID of the maintenance window execution the task is part of.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    # The ID of the specific task in the maintenance window task that should be retrieved.
    @[JSON::Field(key: "TaskId")]
    property task_id : String

    # Optional filters used to scope down the returned task invocations. The supported filter key is
    # `STATUS` with the corresponding values `PENDING`, `IN_PROGRESS`, `SUCCESS`, `FAILED`,
    # `TIMED_OUT`, `CANCELLING`, and `CANCELLED`.
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
      @task_id : String,
      @filters : Array(MaintenanceWindowFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
