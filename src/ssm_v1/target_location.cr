module Amazonite::SsmV1
  class TargetLocation
    include JSON::Serializable

    @[JSON::Field(key: "Accounts")]
    property accounts : Array(String) | Nil

    @[JSON::Field(key: "Regions")]
    property regions : Array(String) | Nil

    @[JSON::Field(key: "TargetLocationMaxConcurrency")]
    property target_location_max_concurrency : String | Nil

    @[JSON::Field(key: "TargetLocationMaxErrors")]
    property target_location_max_errors : String | Nil

    @[JSON::Field(key: "ExecutionRoleName")]
    property execution_role_name : String | Nil

    @[JSON::Field(key: "TargetLocationAlarmConfiguration")]
    property target_location_alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "IncludeChildOrganizationUnits")]
    property include_child_organization_units : Bool | Nil

    @[JSON::Field(key: "ExcludeAccounts")]
    property exclude_accounts : Array(String) | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TargetsMaxConcurrency")]
    property targets_max_concurrency : String | Nil

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
  end
end
