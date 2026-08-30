private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Details about a specific Automation execution.
  class AutomationExecutionMetadata
    include JSON::Serializable

    # The execution ID.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    # The name of the Automation runbook used during execution.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The document version used during the execution.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The status of the execution.
    @[JSON::Field(key: "AutomationExecutionStatus", converter: AS::AutomationExecutionStatus)]
    property automation_execution_status : AutomationExecutionStatus | Nil

    # The time the execution started.
    @[JSON::Field(key: "ExecutionStartTime", converter: Core::AWSEpochConverter)]
    property execution_start_time : Time | Nil

    # The time the execution finished. This isn't populated if the execution is still in progress.
    @[JSON::Field(key: "ExecutionEndTime", converter: Core::AWSEpochConverter)]
    property execution_end_time : Time | Nil

    # The IAM role ARN of the user who ran the automation.
    @[JSON::Field(key: "ExecutedBy")]
    property executed_by : String | Nil

    # An S3 bucket where execution information is stored.
    @[JSON::Field(key: "LogFile")]
    property log_file : String | Nil

    # The list of execution outputs as defined in the Automation runbook.
    @[JSON::Field(key: "Outputs")]
    property outputs : Hash(String, Array(String)) | Nil

    # The Automation execution mode.
    @[JSON::Field(key: "Mode", converter: AS::ExecutionMode)]
    property mode : ExecutionMode | Nil

    # The execution ID of the parent automation.
    @[JSON::Field(key: "ParentAutomationExecutionId")]
    property parent_automation_execution_id : String | Nil

    # The name of the step that is currently running.
    @[JSON::Field(key: "CurrentStepName")]
    property current_step_name : String | Nil

    # The action of the step that is currently running.
    @[JSON::Field(key: "CurrentAction")]
    property current_action : String | Nil

    # A message that describes a failure that occurred during the automation execution.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    # A message that describes a non-critical issue that occurred during the automation execution.
    @[JSON::Field(key: "WarningMessage")]
    property warning_message : String | Nil

    # The list of execution outputs as defined in the Automation runbook.
    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    # The targets defined by the user when starting the automation.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The specified key-value mapping of document parameters to target resources.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # A list of targets that resolved during the execution.
    @[JSON::Field(key: "ResolvedTargets")]
    property resolved_targets : ResolvedTargets | Nil

    # The `MaxConcurrency` value specified by the user when starting the automation.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The `MaxErrors` value specified by the user when starting the automation.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The list of execution outputs as defined in the Automation runbook.
    @[JSON::Field(key: "Target")]
    property target : String | Nil

    # Use this filter with DescribeAutomationExecutions. Specify either Local or CrossAccount.
    # CrossAccount is an Automation that runs in multiple Amazon Web Services Regions and Amazon Web
    # Services accounts. For more information, see [Running automations in multiple Amazon Web
    # Services Regions and
    # accounts](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "AutomationType", converter: AS::AutomationType)]
    property automation_type : AutomationType | Nil

    # The details for the CloudWatch alarm applied to your automation.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarm that was invoked by the automation.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    # A publicly accessible URL for a file that contains the `TargetLocations` body. Currently, only
    # files in presigned Amazon S3 buckets are supported
    @[JSON::Field(key: "TargetLocationsURL")]
    property target_locations_url : String | Nil

    # The subtype of the Automation operation. Currently, the only supported value is `ChangeRequest`.
    @[JSON::Field(key: "AutomationSubtype", converter: AS::AutomationSubtype)]
    property automation_subtype : AutomationSubtype | Nil

    # The date and time the Automation operation is scheduled to start.
    @[JSON::Field(key: "ScheduledTime", converter: Core::AWSEpochConverter)]
    property scheduled_time : Time | Nil

    # Information about the Automation runbooks that are run during a runbook workflow in Change
    # Manager.
    #
    # The Automation runbooks specified for the runbook workflow can't run until all required
    # approvals for the change request have been received.
    @[JSON::Field(key: "Runbooks")]
    property runbooks : Array(Runbook) | Nil

    # The ID of an OpsItem that is created to represent a Change Manager change request.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # The ID of a State Manager association used in the Automation operation.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The name of the Change Manager change request.
    @[JSON::Field(key: "ChangeRequestName")]
    property change_request_name : String | Nil

    def initialize(
      @automation_execution_id : String | Nil = nil,
      @document_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @automation_execution_status : AutomationExecutionStatus | Nil = nil,
      @execution_start_time : Time | Nil = nil,
      @execution_end_time : Time | Nil = nil,
      @executed_by : String | Nil = nil,
      @log_file : String | Nil = nil,
      @outputs : Hash(String, Array(String)) | Nil = nil,
      @mode : ExecutionMode | Nil = nil,
      @parent_automation_execution_id : String | Nil = nil,
      @current_step_name : String | Nil = nil,
      @current_action : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @warning_message : String | Nil = nil,
      @target_parameter_name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @resolved_targets : ResolvedTargets | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target : String | Nil = nil,
      @automation_type : AutomationType | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
      @target_locations_url : String | Nil = nil,
      @automation_subtype : AutomationSubtype | Nil = nil,
      @scheduled_time : Time | Nil = nil,
      @runbooks : Array(Runbook) | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @change_request_name : String | Nil = nil,
    )
    end
  end
end
