private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetMaintenanceWindowExecutionTaskResult
    include JSON::Serializable

    # The ID of the maintenance window execution that includes the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String | Nil

    # The ID of the specific task execution in the maintenance window task that was retrieved.
    @[JSON::Field(key: "TaskExecutionId")]
    property task_execution_id : String | Nil

    # The Amazon Resource Name (ARN) of the task that ran.
    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

    # The role that was assumed when running the task.
    @[JSON::Field(key: "ServiceRole")]
    property service_role : String | Nil

    # The type of task that was run.
    @[JSON::Field(key: "Type", converter: AS::MaintenanceWindowTaskType)]
    property type : MaintenanceWindowTaskType | Nil

    # The parameters passed to the task when it was run.
    #
    # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
    # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
    # about how Systems Manager handles these options for the supported maintenance window task types,
    # see MaintenanceWindowTaskInvocationParameters.
    #
    # The map has the following format:
    #
    # - `Key`: string, between 1 and 255 characters
    #
    # - `Value`: an array of strings, each between 1 and 255 characters
    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Array(Hash(String, MaintenanceWindowTaskParameterValueExpression)) | Nil

    # The priority of the task.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # The defined maximum number of task executions that could be run in parallel.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The defined maximum number of task execution errors allowed before scheduling of the task
    # execution would have been stopped.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The status of the task.
    @[JSON::Field(key: "Status", converter: AS::MaintenanceWindowExecutionStatus)]
    property status : MaintenanceWindowExecutionStatus | Nil

    # The details explaining the status. Not available for all status values.
    @[JSON::Field(key: "StatusDetails")]
    property status_details : String | Nil

    # The time the task execution started.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time | Nil

    # The time the task execution completed.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time | Nil

    # The details for the CloudWatch alarm you applied to your maintenance window task.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarms that were invoked by the maintenance window task.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @window_execution_id : String | Nil = nil,
      @task_execution_id : String | Nil = nil,
      @task_arn : String | Nil = nil,
      @service_role : String | Nil = nil,
      @type : MaintenanceWindowTaskType | Nil = nil,
      @task_parameters : Array(Hash(String, MaintenanceWindowTaskParameterValueExpression)) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @status : MaintenanceWindowExecutionStatus | Nil = nil,
      @status_details : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
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

      if value = @task_arn
        raise Core::ValidationError.new("TaskArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TaskArn length must be <= 1600") if value.size > 1600
      end

      if value = @priority
        raise Core::ValidationError.new("Priority value must be >= 0") if value < 0
      end

      if value = @max_concurrency
        raise Core::ValidationError.new("MaxConcurrency length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxConcurrency length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxConcurrency does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$"))
      end

      if value = @max_errors
        raise Core::ValidationError.new("MaxErrors length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxErrors length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxErrors does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$"))
      end

      if value = @status_details
        raise Core::ValidationError.new("StatusDetails length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusDetails length must be <= 250") if value.size > 250
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

    def_equals_and_hash(@window_execution_id, @task_execution_id, @task_arn, @service_role, @type, @task_parameters, @priority, @max_concurrency, @max_errors, @status, @status_details, @start_time, @end_time, @alarm_configuration, @triggered_alarms)
  end
end
