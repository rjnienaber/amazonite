module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskInvocationRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    @[JSON::Field(key: "TaskId")]
    property task_id : String

    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String

    def initialize(
      @window_execution_id : String,
      @task_id : String,
      @invocation_id : String
    )
    end
  end
end
