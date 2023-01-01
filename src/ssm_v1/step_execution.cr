private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class StepExecution
    include JSON::Serializable

    @[JSON::Field(key: "StepName")]
    property step_name : String | Nil

    @[JSON::Field(key: "Action")]
    property action : String | Nil

    @[JSON::Field(key: "TimeoutSeconds")]
    property timeout_seconds : Int64 | Nil

    @[JSON::Field(key: "OnFailure")]
    property on_failure : String | Nil

    @[JSON::Field(key: "MaxAttempts")]
    property max_attempts : Int32 | Nil

    @[JSON::Field(key: "ExecutionStartTime", converter: Core::AWSEpochConverter)]
    property execution_start_time : Time | Nil

    @[JSON::Field(key: "ExecutionEndTime", converter: Core::AWSEpochConverter)]
    property execution_end_time : Time | Nil

    @[JSON::Field(key: "StepStatus", converter: AS::AutomationExecutionStatus)]
    property step_status : AutomationExecutionStatus | Nil

    @[JSON::Field(key: "ResponseCode")]
    property response_code : String | Nil

    @[JSON::Field(key: "Inputs")]
    property inputs : Hash(String, String) | Nil

    @[JSON::Field(key: "Outputs")]
    property outputs : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "Response")]
    property response : String | Nil

    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    @[JSON::Field(key: "FailureDetails")]
    property failure_details : FailureDetails | Nil

    @[JSON::Field(key: "StepExecutionId")]
    property step_execution_id : String | Nil

    @[JSON::Field(key: "OverriddenParameters")]
    property overridden_parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "IsEnd")]
    property is_end : Bool | Nil

    @[JSON::Field(key: "NextStep")]
    property next_step : String | Nil

    @[JSON::Field(key: "IsCritical")]
    property is_critical : Bool | Nil

    @[JSON::Field(key: "ValidNextSteps")]
    property valid_next_steps : Array(String) | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TargetLocation")]
    property target_location : TargetLocation | Nil

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
      @failure_details : FailureDetails | Nil = nil,
      @step_execution_id : String | Nil = nil,
      @overridden_parameters : Hash(String, Array(String)) | Nil = nil,
      @is_end : Bool | Nil = nil,
      @next_step : String | Nil = nil,
      @is_critical : Bool | Nil = nil,
      @valid_next_steps : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_location : TargetLocation | Nil = nil
    )
    end
  end
end
