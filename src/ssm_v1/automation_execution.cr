private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AutomationExecution
    include JSON::Serializable

    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "ExecutionStartTime", converter: Core::AWSEpochConverter)]
    property execution_start_time : Time | Nil

    @[JSON::Field(key: "ExecutionEndTime", converter: Core::AWSEpochConverter)]
    property execution_end_time : Time | Nil

    @[JSON::Field(key: "AutomationExecutionStatus", converter: AS::AutomationExecutionStatus)]
    property automation_execution_status : AutomationExecutionStatus | Nil

    @[JSON::Field(key: "StepExecutions")]
    property step_executions : Array(StepExecution) | Nil

    @[JSON::Field(key: "StepExecutionsTruncated")]
    property step_executions_truncated : Bool | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "Outputs")]
    property outputs : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    @[JSON::Field(key: "Mode", converter: AS::ExecutionMode)]
    property mode : ExecutionMode | Nil

    @[JSON::Field(key: "ParentAutomationExecutionId")]
    property parent_automation_execution_id : String | Nil

    @[JSON::Field(key: "ExecutedBy")]
    property executed_by : String | Nil

    @[JSON::Field(key: "CurrentStepName")]
    property current_step_name : String | Nil

    @[JSON::Field(key: "CurrentAction")]
    property current_action : String | Nil

    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    @[JSON::Field(key: "ResolvedTargets")]
    property resolved_targets : ResolvedTargets | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "Target")]
    property target : String | Nil

    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    @[JSON::Field(key: "ProgressCounters")]
    property progress_counters : ProgressCounters | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    @[JSON::Field(key: "AutomationSubtype", converter: AS::AutomationSubtype)]
    property automation_subtype : AutomationSubtype | Nil

    @[JSON::Field(key: "ScheduledTime", converter: Core::AWSEpochConverter)]
    property scheduled_time : Time | Nil

    @[JSON::Field(key: "Runbooks")]
    property runbooks : Array(Runbook) | Nil

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "ChangeRequestName")]
    property change_request_name : String | Nil

    def initialize(
      @automation_execution_id : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @execution_start_time : Time | Nil = nil,
      @execution_end_time : Time | Nil = nil,
      @automation_execution_status : AutomationExecutionStatus | Nil = nil,
      @step_executions : Array(StepExecution) | Nil = nil,
      @step_executions_truncated : Bool | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @outputs : Hash(String, Array(String)) | Nil = nil,
      @failure_message : String | Nil = nil,
      @mode : ExecutionMode | Nil = nil,
      @parent_automation_execution_id : String | Nil = nil,
      @executed_by : String | Nil = nil,
      @current_step_name : String | Nil = nil,
      @current_action : String | Nil = nil,
      @target_parameter_name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @resolved_targets : ResolvedTargets | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target : String | Nil = nil,
      @target_locations : Array(TargetLocation) | Nil = nil,
      @progress_counters : ProgressCounters | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
      @automation_subtype : AutomationSubtype | Nil = nil,
      @scheduled_time : Time | Nil = nil,
      @runbooks : Array(Runbook) | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @change_request_name : String | Nil = nil
    )
    end
  end
end
