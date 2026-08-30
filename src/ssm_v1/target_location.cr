module Amazonite::SsmV1
  # The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the
  # current Automation execution.
  class TargetLocation
    include JSON::Serializable

    # The Amazon Web Services accounts targeted by the current Automation execution.
    @[JSON::Field(key: "Accounts")]
    property accounts : Array(String) | Nil

    # The Amazon Web Services Regions targeted by the current Automation execution.
    @[JSON::Field(key: "Regions")]
    property regions : Array(String) | Nil

    # The maximum number of Amazon Web Services Regions and Amazon Web Services accounts allowed to
    # run the Automation concurrently. `TargetLocationMaxConcurrency` has a default value of 1.
    @[JSON::Field(key: "TargetLocationMaxConcurrency")]
    property target_location_max_concurrency : String | Nil

    # The maximum number of errors allowed before the system stops queueing additional Automation
    # executions for the currently running Automation. `TargetLocationMaxErrors` has a default value
    # of 0.
    @[JSON::Field(key: "TargetLocationMaxErrors")]
    property target_location_max_errors : String | Nil

    # The Automation execution role used by the currently running Automation. If not specified, the
    # default value is `AWS-SystemsManager-AutomationExecutionRole`.
    @[JSON::Field(key: "ExecutionRoleName")]
    property execution_role_name : String | Nil

    @[JSON::Field(key: "TargetLocationAlarmConfiguration")]
    property target_location_alarm_configuration : AlarmConfiguration | Nil

    # Indicates whether to include child organizational units (OUs) that are children of the targeted
    # OUs. The default is `false`.
    @[JSON::Field(key: "IncludeChildOrganizationUnits")]
    property include_child_organization_units : Bool | Nil

    # Amazon Web Services accounts or organizational units to exclude as expanded targets.
    @[JSON::Field(key: "ExcludeAccounts")]
    property exclude_accounts : Array(String) | Nil

    # A list of key-value mappings to target resources. If you specify values for this data type, you
    # must also specify a value for `TargetParameterName`.
    #
    # This `Targets` parameter takes precedence over the `StartAutomationExecution:Targets` parameter
    # if both are supplied.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The maximum number of targets allowed to run this task in parallel. This `TargetsMaxConcurrency`
    # takes precedence over the `StartAutomationExecution:MaxConcurrency` parameter if both are
    # supplied.
    @[JSON::Field(key: "TargetsMaxConcurrency")]
    property targets_max_concurrency : String | Nil

    # The maximum number of errors that are allowed before the system stops running the automation on
    # additional targets. This `TargetsMaxErrors` parameter takes precedence over the
    # `StartAutomationExecution:MaxErrors` parameter if both are supplied.
    @[JSON::Field(key: "TargetsMaxErrors")]
    property targets_max_errors : String | Nil

    def initialize(
      @accounts : Array(String) | Nil = nil,
      @regions : Array(String) | Nil = nil,
      @target_location_max_concurrency : String | Nil = nil,
      @target_location_max_errors : String | Nil = nil,
      @execution_role_name : String | Nil = nil,
      @target_location_alarm_configuration : AlarmConfiguration | Nil = nil,
      @include_child_organization_units : Bool | Nil = nil,
      @exclude_accounts : Array(String) | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @targets_max_concurrency : String | Nil = nil,
      @targets_max_errors : String | Nil = nil,
    )
    end

    def_equals_and_hash(@accounts, @regions, @target_location_max_concurrency, @target_location_max_errors, @execution_role_name, @target_location_alarm_configuration, @include_child_organization_units, @exclude_accounts, @targets, @targets_max_concurrency, @targets_max_errors)
  end
end
