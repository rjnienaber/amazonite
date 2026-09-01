private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateMaintenanceWindowTaskRequest
    include JSON::Serializable

    # The maintenance window ID that contains the task to modify.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The task ID to modify.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String

    # The targets (either managed nodes or tags) to modify. Managed nodes are specified using the
    # format `Key=instanceids,Values=instanceID_1,instanceID_2`. Tags are specified using the format `
    # Key=tag_name,Values=tag_value`.
    #
    # One or more targets must be specified for maintenance window Run Command-type tasks. Depending
    # on the task, targets are optional for other maintenance window task types (Automation, Lambda,
    # and Step Functions). For more information about running tasks that don't specify targets, see
    # [Registering maintenance window tasks without
    # targets](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The task ARN to modify.
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

    # The parameters to modify.
    #
    # `TaskParameters` has been deprecated. To specify parameters to pass to a task when it runs,
    # instead use the `Parameters` option in the `TaskInvocationParameters` structure. For information
    # about how Systems Manager handles these options for the supported maintenance window task types,
    # see MaintenanceWindowTaskInvocationParameters.
    #
    # The map has the following format:
    #
    # Key: string, between 1 and 255 characters
    #
    # Value: an array of strings, each string is between 1 and 255 characters
    @[JSON::Field(key: "TaskParameters")]
    property task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil

    # The parameters that the task should use during execution. Populate only the fields that match
    # the task type. All other fields should be empty.
    #
    # When you update a maintenance window task that has options specified in
    # `TaskInvocationParameters`, you must provide again all the `TaskInvocationParameters` values
    # that you want to retain. The values you don't specify again are removed. For example, suppose
    # that when you registered a Run Command task, you specified `TaskInvocationParameters` values for
    # `Comment`, `NotificationConfig`, and `OutputS3BucketName`. If you update the maintenance window
    # task and specify only a different `OutputS3BucketName` value, the values for `Comment` and
    # `NotificationConfig` are removed.
    @[JSON::Field(key: "TaskInvocationParameters")]
    property task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil

    # The new task priority to specify. The lower the number, the higher the priority. Tasks that have
    # the same priority are scheduled in parallel.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # The new `MaxConcurrency` value you want to specify. `MaxConcurrency` is the number of targets
    # that are allowed to run this task, in parallel.
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

    # The new `MaxErrors` value to specify. `MaxErrors` is the maximum number of errors that are
    # allowed before the task stops being scheduled.
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

    # The new logging location in Amazon S3 to specify.
    #
    # `LoggingInfo` has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3)
    # bucket to contain logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options in
    # the `TaskInvocationParameters` structure. For information about how Amazon Web Services Systems
    # Manager handles these options for the supported maintenance window task types, see
    # MaintenanceWindowTaskInvocationParameters.
    @[JSON::Field(key: "LoggingInfo")]
    property logging_info : LoggingInfo | Nil

    # The new task name to specify.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The new task description to specify.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # If True, then all fields that are required by the RegisterTaskWithMaintenanceWindow operation
    # are also required for this API request. Optional fields that aren't specified are set to null.
    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

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
      @window_task_id : String,
      @targets : Array(Target) | Nil = nil,
      @task_arn : String | Nil = nil,
      @service_role_arn : String | Nil = nil,
      @task_parameters : Hash(String, MaintenanceWindowTaskParameterValueExpression) | Nil = nil,
      @task_invocation_parameters : MaintenanceWindowTaskInvocationParameters | Nil = nil,
      @priority : Int32 | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @logging_info : LoggingInfo | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @replace : Bool | Nil = nil,
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

    def_equals_and_hash(@window_id, @window_task_id, @targets, @task_arn, @service_role_arn, @task_parameters, @task_invocation_parameters, @priority, @max_concurrency, @max_errors, @logging_info, @name, @description, @replace, @cutoff_behavior, @alarm_configuration)
  end
end
