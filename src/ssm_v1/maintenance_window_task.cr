private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Information about a task defined for a maintenance window.
  class MaintenanceWindowTask
    include JSON::Serializable

    # The ID of the maintenance window where the task is registered.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The task ID.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    # The resource that the task uses during execution. For `RUN_COMMAND` and `AUTOMATION` task types,
    # `TaskArn` is the Amazon Web Services Systems Manager (SSM document) name or ARN. For `LAMBDA`
    # tasks, it's the function name or ARN. For `STEP_FUNCTIONS` tasks, it's the state machine ARN.
    #
    # Maintenance Window does not validate the TaskArn when you register a task. A successful
    # registration does not guarantee that the TaskArn is valid.
    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

    # The type of task.
    @[JSON::Field(key: "Type", converter: AS::MaintenanceWindowTaskType)]
    property type : MaintenanceWindowTaskType | Nil

    # The targets (either managed nodes or tags). Managed nodes are specified using
    # `Key=instanceids,Values=,`. Tags are specified using `Key=,Values=`.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The parameters that should be passed to the task when it is run.
    #
    # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
    # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
    # about how Systems Manager handles these options for the supported maintenance window task types,
    # see MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    # The priority of the task in the maintenance window. The lower the number, the higher the
    # priority. Tasks that have the same priority are scheduled in parallel.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # Information about an S3 bucket to write task-level logs to.
    #
    # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
    # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
    # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
    # Manager handles these options for the supported maintenance window task types, see
    # MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    # The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager
    # to assume when running a maintenance window task. If you do not specify a service role ARN,
    # Systems Manager uses a service-linked role in your account. If no appropriate service-linked
    # role for Systems Manager exists in your account, it is created when you run
    # `RegisterTaskWithMaintenanceWindow`.
    #
    # However, for an improved security posture, we strongly recommend creating a custom policy and
    # custom service role for running your maintenance window tasks. The policy can be crafted to
    # provide only the permissions needed for your particular maintenance window tasks. For more
    # information, see [Setting up Maintenance
    # Windows](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html)
    # in the in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ServiceRoleArn")]
    property service_role_arn : String | Nil

    # The maximum number of targets this task can be run for, in parallel.
    #
    # Although this element is listed as "Required: No", a value can be omitted only when you are
    # registering or updating a [targetless
    # task](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
    # You must provide a value in all other cases.
    #
    # For maintenance window tasks without a target specified, you can't supply a value for this
    # option. Instead, the system inserts a placeholder value of `1`. This value doesn't affect the
    # running of your task.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The maximum number of errors allowed before this task stops being scheduled.
    #
    # Although this element is listed as "Required: No", a value can be omitted only when you are
    # registering or updating a [targetless
    # task](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
    # You must provide a value in all other cases.
    #
    # For maintenance window tasks without a target specified, you can't supply a value for this
    # option. Instead, the system inserts a placeholder value of `1`. This value doesn't affect the
    # running of your task.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The task name.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A description of the task.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The specification for whether tasks should continue to run after the cutoff time specified in
    # the maintenance windows is reached.
    @[JSON::Field(key: "CutoffBehavior", converter: AS::MaintenanceWindowTaskCutoffBehavior)]
    property cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil

    # The details for the CloudWatch alarm applied to your maintenance window task.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil,
      @task_arn : String | Nil = nil,
      @type : MaintenanceWindowTaskType | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
    )
    end
  end
end
