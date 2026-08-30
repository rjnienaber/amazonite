module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskRequest
    include JSON::Serializable

    # The ID of the maintenance window execution that includes the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    # The ID of the specific task execution in the maintenance window task that should be retrieved.
    @[JSON::Field(key: "TaskId")]
    property task_id : String

    def initialize(
      @window_execution_id : String,
      @task_id : String,
    )
    end

    def_equals_and_hash(@window_execution_id, @task_id)
  end
end
