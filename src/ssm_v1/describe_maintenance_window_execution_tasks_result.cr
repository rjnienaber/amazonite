private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTasksResult
    include JSON::Serializable

    # Information about the task executions.
    @[JSON::Field(key: "WindowExecutionTaskIdentities")]
    property window_execution_task_identities : Array(MaintenanceWindowExecutionTaskIdentity) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_execution_task_identities : Array(MaintenanceWindowExecutionTaskIdentity) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_execution_task_identities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@window_execution_task_identities, @next_token)
  end
end
