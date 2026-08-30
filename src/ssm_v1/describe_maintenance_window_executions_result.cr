module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionsResult
    include JSON::Serializable

    # Information about the maintenance window executions.
    @[JSON::Field(key: "WindowExecutions")]
    property window_executions : Array(MaintenanceWindowExecution) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_executions : Array(MaintenanceWindowExecution) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
