private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetMaintenanceWindowTaskResult
    include JSON::Serializable

    # The retrieved maintenance window ID.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The retrieved maintenance window task ID.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    # The targets where the task should run.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The resource that the task used during execution. For `RUN_COMMAND` and `AUTOMATION` task types,
    # the value of `TaskArn` is the SSM document name/ARN. For `LAMBDA` tasks, the value is the
    # function name/ARN. For `STEP_FUNCTIONS` tasks, the value is the state machine ARN.
    @[JSON::Field(key: "TaskArn")]
    property task_arn : String | Nil

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

    # The type of task to run.
    @[JSON::Field(key: "TaskType", converter: AS::MaintenanceWindowTaskType)]
    property task_type : MaintenanceWindowTaskType | Nil

    # The parameters to pass to the task when it runs.
    #
    # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
    # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
    # about how Systems Manager handles these options for the supported maintenance window task types,
    # see MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    # The parameters to pass to the task when it runs.
    @[JSON::Field(key: "TaskInvocationParameters")]
    property task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil

    # The priority of the task when it runs. The lower the number, the higher the priority. Tasks that
    # have the same priority are scheduled in parallel.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # The maximum number of targets allowed to run this task in parallel.
    #
    # For maintenance window tasks without a target specified, you can't supply a value for this
    # option. Instead, the system inserts a placeholder value of `1`, which may be reported in the
    # response to this command. This value doesn't affect the running of your task and can be ignored.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The maximum number of errors allowed before the task stops being scheduled.
    #
    # For maintenance window tasks without a target specified, you can't supply a value for this
    # option. Instead, the system inserts a placeholder value of `1`, which may be reported in the
    # response to this command. This value doesn't affect the running of your task and can be ignored.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The location in Amazon Simple Storage Service (Amazon S3) where the task results are logged.
    #
    # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
    # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
    # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
    # Manager handles these options for the supported maintenance window task types, see
    # MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    # The retrieved task name.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The retrieved task description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The action to take on tasks when the maintenance window cutoff time is reached. `CONTINUE_TASK`
    # means that tasks continue to run. For Automation, Lambda, Step Functions tasks, `CANCEL_TASK`
    # means that currently running task invocations continue, but no new task invocations are started.
    # For Run Command tasks, `CANCEL_TASK` means the system attempts to stop the task by sending a
    # `CancelCommand` operation.
    @[JSON::Field(key: "CutoffBehavior", converter: AS::MaintenanceWindowTaskCutoffBehavior)]
    property cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil

    # The details for the CloudWatch alarm you applied to your maintenance window task.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @task_arn : String | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @task_type : MaintenanceWindowTaskType | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @cutoff_behavior : MaintenanceWindowTaskCutoffBehavior | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @window_task_id
        raise Core::ValidationError.new("WindowTaskId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowTaskId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowTaskId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @task_arn
        raise Core::ValidationError.new("TaskArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TaskArn length must be <= 1600") if value.size > 1600
      end

      if value = @task_parameters
        value.each_value(&.validate!)
      end

      if value = @task_invocation_parameters
        value.validate!
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

      if value = @logging_info
        value.validate!
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 128") if value.size > 128
      end

      if value = @alarm_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@window_id, @window_task_id, @targets, @task_arn, @service_role_arn, @task_type, @task_parameters, @task_invocation_parameters, @priority, @max_concurrency, @max_errors, @logging_info, @name, @description, @cutoff_behavior, @alarm_configuration)
  end
end
