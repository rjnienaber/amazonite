module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTaskInvocationsResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionTaskInvocationIdentities")]
    property window_execution_task_invocation_identities : Array(MaintenanceWindowExecutionTaskInvocationIdentity) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_execution_task_invocation_identities : Array(MaintenanceWindowExecutionTaskInvocationIdentity) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
