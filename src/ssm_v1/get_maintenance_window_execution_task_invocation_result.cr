private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionTaskInvocationResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String | Nil

    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : String | Nil

    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_execution_id : String | Nil = nil,
      @invocation_id : String | Nil = nil,
      @execution_id : String | Nil = nil,
      @task_type : MaintenanceWindowTaskType | Nil = nil,
      @parameters : String | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @owner_information : String | Nil = nil,
      @window_target_id : String | Nil = nil
    )
    end
  end
end
