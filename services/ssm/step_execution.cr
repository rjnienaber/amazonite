private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Detailed information about an the execution state of an Automation step.
  class StepExecution
    include JSON::Serializable

    # The name of this execution step.
    @[JSON::Field(key: "StepName")]
    property step_name : String | Nil

    # The action this step performs. The action determines the behavior of the step.
    @[JSON::Field(key: "Action")]
    property action : String | Nil

    # The timeout seconds of the step.
    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int64 | Nil

    # The action to take if the step fails. The default value is `Abort`.
    @[JSON::Field(key: "OnFailure")]
    property on_failure : String | Nil

    # The maximum number of tries to run the action of the step. The default value is `1`.
    @[JSON::Field(key: "MaxAttempts")]
    property max_attempts : Int32 | Nil

    # If a step has begun execution, this contains the time the step started. If the step is in
    # Pending status, this field isn't populated.
    @[JSON::Field(key: "ExecutionStartTime", converter: Core::AWSEpochConverter)]
    property execution_start_time : Time | Nil

    # If a step has finished execution, this contains the time the execution ended. If the step hasn't
    # yet concluded, this field isn't populated.
    @[JSON::Field(key: "ExecutionEndTime", converter: Core::AWSEpochConverter)]
    property execution_end_time : Time | Nil

    # The execution status for this step.
    @[JSON::Field(key: "StepStatus", converter: AS::AutomationExecutionStatus)]
    property step_status : AutomationExecutionStatus | Nil

    # The response code returned by the execution of the step.
    @[JSON::Field(key: "ResponseCode")]
    property response_code : String | Nil

    # Fully-resolved values passed into the step before execution.
    @[JSON::Field(key: "Inputs")]
    property inputs : Hash(String, String) | Nil

    # Returned values from the execution of the step.
    @[JSON::Field(key: "Outputs")]
    property outputs : Hash(String, Array(String)) | Nil

    # A message associated with the response code for an execution.
    @[JSON::Field(key: "Response")]
    property response : String | Nil

    # If a step failed, this message explains why the execution failed.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    # A message that describes a non-critical issue that occurred during the step execution. Present
    # only if the step status includes a warning.
    @[JSON::Field(key: "WarningMessage")]
    property warning_message : String | Nil

    # Information about the Automation failure.
    @[JSON::Field(key: "FailureDetails")]
    property failure_details : FailureDetails | Nil

    # The unique ID of a step execution.
    @[JSON::Field(key: "StepExecutionId")]
    property step_execution_id : String | Nil

    # A user-specified list of parameters to override when running a step.
    @[JSON::Field(key: "OverriddenParameters")]
    property overridden_parameters : Hash(String, Array(String)) | Nil

    # The flag which can be used to end automation no matter whether the step succeeds or fails.
    @[JSON::Field(key: "IsEnd")]
    property is_end : Bool | Nil

    # The next step after the step succeeds.
    @[JSON::Field(key: "NextStep")]
    property next_step : String | Nil

    # The flag which can be used to help decide whether the failure of current step leads to the
    # Automation failure.
    @[JSON::Field(key: "IsCritical")]
    property is_critical : Bool | Nil

    # Strategies used when step fails, we support Continue and Abort. Abort will fail the automation
    # when the step fails. Continue will ignore the failure of current step and allow automation to
    # run the next step. With conditional branching, we add step:stepName to support the automation to
    # go to another specific step.
    @[JSON::Field(key: "ValidNextSteps")]
    property valid_next_steps : Array(String) | Nil

    # The targets for the step execution.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the
    # current Automation execution.
    @[JSON::Field(key: "TargetLocation")]
    property target_location : TargetLocation | Nil

    # The CloudWatch alarms that were invoked by the automation.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    # Information about the parent step.
    @[JSON::Field(key: "ParentStepDetails")]
    property parent_step_details : ParentStepDetails | Nil

    def initialize(
      @step_name : String | Nil = nil,
      @action : String | Nil = nil,
      @timeout_seconds : Int64 | Nil = nil,
      @on_failure : String | Nil = nil,
      @max_attempts : Int32 | Nil = nil,
      @execution_start_time : Time | Nil = nil,
      @execution_end_time : Time | Nil = nil,
      @step_status : AutomationExecutionStatus | Nil = nil,
      @response_code : String | Nil = nil,
      @inputs : Hash(String, String) | Nil = nil,
      @outputs : Hash(String, Array(String)) | Nil = nil,
      @response : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @warning_message : String | Nil = nil,
      @failure_details : FailureDetails | Nil = nil,
      @step_execution_id : String | Nil = nil,
      @overridden_parameters : Hash(String, Array(String)) | Nil = nil,
      @is_end : Bool | Nil = nil,
      @next_step : String | Nil = nil,
      @is_critical : Bool | Nil = nil,
      @valid_next_steps : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_location : TargetLocation | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
      @parent_step_details : ParentStepDetails | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @action
        raise Core::ValidationError.new("Action does not match the required pattern") unless value.matches?(Regex.new("^aws:[a-zA-Z]{3,25}$"))
      end

      if value = @outputs
        raise Core::ValidationError.new("Outputs must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Outputs must have at most 200 entry(s)") if value.size > 200
      end

      if value = @failure_details
        value.validate!
      end

      if value = @overridden_parameters
        raise Core::ValidationError.new("OverriddenParameters must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("OverriddenParameters must have at most 200 entry(s)") if value.size > 200
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @target_location
        value.validate!
      end

      if value = @triggered_alarms
        raise Core::ValidationError.new("TriggeredAlarms must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TriggeredAlarms must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @parent_step_details
        value.validate!
      end
    end

    def_equals_and_hash(@step_name, @action, @timeout_seconds, @on_failure, @max_attempts, @execution_start_time, @execution_end_time, @step_status, @response_code, @inputs, @outputs, @response, @failure_message, @warning_message, @failure_details, @step_execution_id, @overridden_parameters, @is_end, @next_step, @is_critical, @valid_next_steps, @targets, @target_location, @triggered_alarms, @parent_step_details)
  end
end
