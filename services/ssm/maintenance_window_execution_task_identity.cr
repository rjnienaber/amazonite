private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about a task execution performed as part of a maintenance window execution.
  class MaintenanceWindowExecutionTaskIdentity
    include JSON::Serializable

    # The ID of the maintenance window execution that ran the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The ID of the specific task execution in the maintenance window execution.
    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    # The status of the task execution.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status of the task execution. Not available for all status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time the task execution started.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time the task execution finished.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # The Amazon Resource Name (ARN) of the task that ran.
    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

    # The type of task that ran.
    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType | Nil

    # The details for the CloudWatch alarm applied to your maintenance window task.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarm that was invoked by the maintenance window task.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_execution_id : String | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @task_arn : String | Nil = nil,
      @task_type : MaintenanceWindowTaskType | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
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

      if value = @status_details
        raise Core::ValidationError.new("StatusDetails length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusDetails length must be <= 250") if value.size > 250
      end

      if value = @task_arn
        raise Core::ValidationError.new("TaskArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TaskArn length must be <= 1600") if value.size > 1600
      end

      if value = @alarm_configuration
        value.validate!
      end

      if value = @triggered_alarms
        raise Core::ValidationError.new("TriggeredAlarms must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TriggeredAlarms must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@window_execution_id, @task_execution_id, @status, @status_details, @start_time, @end_time, @task_arn, @task_type, @alarm_configuration, @triggered_alarms)
  end
end
