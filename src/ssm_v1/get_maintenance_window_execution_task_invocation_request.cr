module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskInvocationRequest
    include JSON::Serializable

    # The ID of the maintenance window execution for which the task is a part.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    # The ID of the specific task in the maintenance window task that should be retrieved.
    @[JSON::Field(key: "TaskId")]
    property task_id : String

    # The invocation ID to retrieve.
    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String

    def initialize(
      @window_execution_id : String,
      @task_id : String,
      @invocation_id : String,
    )
    end

    def_equals_and_hash(@window_execution_id, @task_id, @invocation_id)
  end
end
