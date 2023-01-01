module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    @[JSON::Field(key: "TaskId")]
    property task_id : String

    def initialize(
      @window_execution_id : String,
      @task_id : String
    )
    end
  end
end
