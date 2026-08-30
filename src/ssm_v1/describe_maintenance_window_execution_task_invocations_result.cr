private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionTaskInvocationsResult
    include JSON::Serializable

    # Information about the task invocation results per invocation.
    @[JSON::Field(key: "WindowExecutionTaskInvocationIdentities")]
    property window_execution_task_invocation_identities : Array(MaintenanceWindowExecutionTaskInvocationIdentity) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_execution_task_invocation_identities : Array(MaintenanceWindowExecutionTaskInvocationIdentity) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_execution_task_invocation_identities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@window_execution_task_invocation_identities, @next_token)
  end
end
