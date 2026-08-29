private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes the information about a task invocation for a particular target as part of a task
  # execution performed as part of a maintenance window execution.
  class MaintenanceWindowExecutionTaskInvocationIdentity
    include JSON::Serializable

    # The ID of the maintenance window execution that ran the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The ID of the specific task execution in the maintenance window execution.
    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    # The ID of the task invocation.
    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String | Nil

    # The ID of the action performed in the service that actually handled the task invocation. If the
    # task type is `RUN_COMMAND`, this value is the command ID.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    # The task type.
    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType | Nil

    # The parameters that were provided for the invocation when it was run.
    @[JSON::Field(key: "Parameters")]
    property parameters : String | Nil

    # The status of the task invocation.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status of the task invocation. Not available for all status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time the invocation started.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time the invocation finished.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # User-provided value that was specified when the target was registered with the maintenance
    # window. This was also included in any Amazon CloudWatch Events events raised during the task
    # invocation.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The ID of the target definition in this maintenance window the invocation was performed for.
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
      @window_target_id : String | Nil = nil,
    )
    end
  end
end
