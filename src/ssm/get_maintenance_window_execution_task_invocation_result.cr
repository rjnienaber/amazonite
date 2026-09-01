private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetMaintenanceWindowExecutionTaskInvocationResult
    include JSON::Serializable

    # The maintenance window execution ID.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The task execution ID.
    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    # The invocation ID.
    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String | Nil

    # The execution ID.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    # Retrieves the task type for a maintenance window.
    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType | Nil

    # The parameters used at the time that the task ran.
    @[JSON::Field(key: "Parameters")]
    property parameters : String | Nil

    # The task status for an invocation.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status. Details are only available for certain status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time that the task started running on the target.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time that the task finished running on the target.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # User-provided value to be included in any Amazon CloudWatch Events or Amazon EventBridge events
    # raised while running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The maintenance window target ID.
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

    def validate! : Nil
      if value = @window_execution_id
        raise Core::ValidationError.new("WindowExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowExecutionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @task_execution_id
        raise Core::ValidationError.new("TaskExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("TaskExecutionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("TaskExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @invocation_id
        raise Core::ValidationError.new("InvocationId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("InvocationId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("InvocationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @status_details
        raise Core::ValidationError.new("StatusDetails length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusDetails length must be <= 250") if value.size > 250
      end

      if value = @owner_information
        raise Core::ValidationError.new("OwnerInformation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwnerInformation length must be <= 128") if value.size > 128
      end

      if value = @window_target_id
        raise Core::ValidationError.new("WindowTargetId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("WindowTargetId length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@window_execution_id, @task_execution_id, @invocation_id, @execution_id, @task_type, @parameters, @status, @status_details, @start_time, @end_time, @owner_information, @window_target_id)
  end
end
