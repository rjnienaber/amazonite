private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
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
  end
end
