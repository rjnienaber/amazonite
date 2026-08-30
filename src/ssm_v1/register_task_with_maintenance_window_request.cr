private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class RegisterTaskWithMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window the task should be added to.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The targets (either managed nodes or maintenance window targets).
    #
    # One or more targets must be specified for maintenance window Run Command-type tasks. Depending
    # on the task, targets are optional for other maintenance window task types (Automation, Lambda,
    # and Step Functions). For more information about running tasks that don't specify targets, see
    # [Registering maintenance window tasks without
    # targets](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # Specify managed nodes using the following format:
    #
    # `Key=InstanceIds,Values=,`
    #
    # Specify maintenance window targets using the following format:
    #
    # `Key=WindowTargetIds,Values=,`
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The ARN of the task to run.
    @[JSON::Field(key: "TaskArn")]
    property task_arn : String

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

    # The type of task being registered.
    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType

    # The parameters that should be passed to the task when it is run.
    #
    # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
    # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
    # about how Systems Manager handles these options for the supported maintenance window task types,
    # see MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    # The parameters that the task should use during execution. Populate only the fields that match
    # the task type. All other fields should be empty.
    @[JSON::Field(key: "TaskInvocationParameters")]
    property task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil

    # The priority of the task in the maintenance window, the lower the number the higher the
    # priority. Tasks in a maintenance window are scheduled in priority order with tasks that have the
    # same priority scheduled in parallel.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

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

    # A structure containing information about an Amazon Simple Storage Service (Amazon S3) bucket to
    # write managed node-level logs to.
    #
    # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
    # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
    # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
    # Manager handles these options for the supported maintenance window task types, see
    # MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    # An optional name for the task.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description for the task.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # User-provided idempotency token.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # Indicates whether tasks should continue to run after the cutoff time specified in the
    # maintenance windows is reached.
    #
    # - `CONTINUE_TASK`: When the cutoff time is reached, any tasks that are running continue. The
    # default value.
    #
    # - `CANCEL_TASK`:
    #
    # - For Automation, Lambda, Step Functions tasks: When the cutoff time is reached, any task
    # invocations that are already running continue, but no new task invocations are started.
    #
    # - For Run Command tasks: When the cutoff time is reached, the system sends a CancelCommand
    # operation that attempts to cancel the command associated with the task. However, there is no
    # guarantee that the command will be terminated and the underlying process stopped.
    #
    # The status for tasks that are not completed is `TIMED_OUT`.
    @[JSON::Field(key: "CutoffBehavior", converter: AS::MaintenanceWindowTaskCutoffBehavior)]
    property cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil

    # The CloudWatch alarm you want to apply to your maintenance window task.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @window_id : String,
      @task_arn : String,
      @task_type : MaintenanceWindowTaskType,
      @targets : Array(Target) | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
      @cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @targets, @task_arn, @service_role_arn, @task_type, @task_parameters, @task_invocation_parameters, @priority, @max_concurrency, @max_errors, @logging_info, @name, @description, @client_token, @cutoff_behavior, @alarm_configuration)
  end
end
