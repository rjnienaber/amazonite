private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Detailed information about the current state of an individual Automation execution.
  class AutomationExecution
    include JSON::Serializable

    # The execution ID.
    @[JSON::Field(key: "AutomationExecutionId")]
    property automation_execution_id : String | Nil

    # The name of the Automation runbook used during the execution.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The version of the document to use during execution.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The time the execution started.
    @[JSON::Field(key: "ExecutionStartTime", converter: Core::AWSEpochConverter)]
    property execution_start_time : Time | Nil

    # The time the execution finished.
    @[JSON::Field(key: "ExecutionEndTime", converter: Core::AWSEpochConverter)]
    property execution_end_time : Time | Nil

    # The execution status of the Automation.
    @[JSON::Field(key: "AutomationExecutionStatus", converter: AS::AutomationExecutionStatus)]
    property automation_execution_status : AutomationExecutionStatus | Nil

    # A list of details about the current state of all steps that comprise an execution. An Automation
    # runbook contains a list of steps that are run in order.
    @[JSON::Field(key: "StepExecutions")]
    property step_executions : Array(StepExecution) | Nil

    # A boolean value that indicates if the response contains the full list of the Automation step
    # executions. If true, use the DescribeAutomationStepExecutions API operation to get the full list
    # of step executions.
    @[JSON::Field(key: "StepExecutionsTruncated")]
    property step_executions_truncated : Bool | Nil

    # The key-value map of execution parameters, which were supplied when calling
    # StartAutomationExecution.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The list of execution outputs as defined in the Automation runbook.
    @[JSON::Field(key: "Outputs")]
    property outputs : Hash(String, Array(String)) | Nil

    # A message describing why an execution has failed, if the status is set to Failed.
    @[JSON::Field(key: "FailureMessage")]
    property failure_message : String | Nil

    # A message that describes a non-critical issue that occurred during the automation execution.
    @[JSON::Field(key: "WarningMessage")]
    property warning_message : String | Nil

    # The automation execution mode.
    @[JSON::Field(key: "Mode", converter: AS::ExecutionMode)]
    property mode : ExecutionMode | Nil

    # The AutomationExecutionId of the parent automation.
    @[JSON::Field(key: "ParentAutomationExecutionId")]
    property parent_automation_execution_id : String | Nil

    # The Amazon Resource Name (ARN) of the user who ran the automation.
    @[JSON::Field(key: "ExecutedBy")]
    property executed_by : String | Nil

    # The name of the step that is currently running.
    @[JSON::Field(key: "CurrentStepName")]
    property current_step_name : String | Nil

    # The action of the step that is currently running.
    @[JSON::Field(key: "CurrentAction")]
    property current_action : String | Nil

    # The parameter name.
    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    # The specified targets.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The specified key-value mapping of document parameters to target resources.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # A list of resolved targets in the rate control execution.
    @[JSON::Field(key: "ResolvedTargets")]
    property resolved_targets : ResolvedTargets | Nil

    # The `MaxConcurrency` value specified by the user when the execution started.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The MaxErrors value specified by the user when the execution started.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The target of the execution.
    @[JSON::Field(key: "Target")]
    property target : String | Nil

    # The combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you
    # want to run the Automation.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    # An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager
    # console for a multi-Region and multi-account Automation execution.
    @[JSON::Field(key: "ProgressCounters")]
    property progress_counters : ProgressCounters | Nil

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

    # Information about the Automation runbooks that are run as part of a runbook workflow.
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

    # Variables defined for the automation.
    @[JSON::Field(key: "Variables")]
    property variables : Hash(String, Array(String)) | Nil

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
      @warning_message : String | Nil = nil,
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
      @target_locations_url : String | Nil = nil,
      @automation_subtype : AutomationSubtype | Nil = nil,
      @scheduled_time : Time | Nil = nil,
      @runbooks : Array(Runbook) | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @change_request_name : String | Nil = nil,
      @variables : Hash(String, Array(String)) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @automation_execution_id
        raise Core::ValidationError.new("AutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("AutomationExecutionId length must be <= 36") if value.size > 36
      end

      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @step_executions
        value.each(&.validate!)
      end

      if value = @parameters
        raise Core::ValidationError.new("Parameters must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Parameters must have at most 200 entry(s)") if value.size > 200
      end

      if value = @outputs
        raise Core::ValidationError.new("Outputs must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Outputs must have at most 200 entry(s)") if value.size > 200
      end

      if value = @parent_automation_execution_id
        raise Core::ValidationError.new("ParentAutomationExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("ParentAutomationExecutionId length must be <= 36") if value.size > 36
      end

      if value = @target_parameter_name
        raise Core::ValidationError.new("TargetParameterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetParameterName length must be <= 50") if value.size > 50
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @target_maps
        raise Core::ValidationError.new("TargetMaps must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TargetMaps must have at most 300 item(s)") if value.size > 300
      end

      if value = @resolved_targets
        value.validate!
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

      if value = @target_locations
        raise Core::ValidationError.new("TargetLocations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TargetLocations must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @progress_counters
        value.validate!
      end

      if value = @alarm_configuration
        value.validate!
      end

      if value = @triggered_alarms
        raise Core::ValidationError.new("TriggeredAlarms must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TriggeredAlarms must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @target_locations_url
        raise Core::ValidationError.new("TargetLocationsURL does not match the required pattern") unless value.matches?(Regex.new("^https:\\/\\/[-a-zA-Z0-9@:%._\\+~#=]{1,253}\\.s3(\\.[a-z\\d-]{9,16})?\\.amazonaws\\.com\\/.{1,2000}$"))
      end

      if value = @runbooks
        raise Core::ValidationError.new("Runbooks must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Runbooks must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @change_request_name
        raise Core::ValidationError.new("ChangeRequestName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeRequestName length must be <= 1024") if value.size > 1024
      end

      if value = @variables
        raise Core::ValidationError.new("Variables must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Variables must have at most 200 entry(s)") if value.size > 200
      end
    end

    def_equals_and_hash(@automation_execution_id, @document_name, @document_version, @execution_start_time, @execution_end_time, @automation_execution_status, @step_executions, @step_executions_truncated, @parameters, @outputs, @failure_message, @warning_message, @mode, @parent_automation_execution_id, @executed_by, @current_step_name, @current_action, @target_parameter_name, @targets, @target_maps, @resolved_targets, @max_concurrency, @max_errors, @target, @target_locations, @progress_counters, @alarm_configuration, @triggered_alarms, @target_locations_url, @automation_subtype, @scheduled_time, @runbooks, @ops_item_id, @association_id, @change_request_name, @variables)
  end
end
