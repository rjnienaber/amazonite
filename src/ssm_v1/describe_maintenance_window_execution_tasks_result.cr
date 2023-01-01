module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTasksResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionTaskIdentities")]
    property window_execution_task_identities : Array(MaintenanceWindowExecutionTaskIdentity) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_execution_task_identities : Array(MaintenanceWindowExecutionTaskIdentity) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
