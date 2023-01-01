private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AssociationDescription
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    @[JSON::Field(key: "Date", converter: Core::AWSEpochConverter)]
    property date : Time | Nil

    @[JSON::Field(key: "LastUpdateAssociationDate", converter: Core::AWSEpochConverter)]
    property last_update_association_date : Time | Nil

    @[JSON::Field(key: "Status")]
    property status : AssociationStatus | Nil

    @[JSON::Field(key: "Overview")]
    property overview : AssociationOverview | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "AutomationTargetParameterName")]
    property automation_target_parameter_name : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    @[JSON::Field(key: "OutputLocation")]
    property output_location : InstanceAssociationOutputLocation | Nil

    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    @[JSON::Field(key: "LastSuccessfulExecutionDate", converter: Core::AWSEpochConverter)]
    property last_successful_execution_date : Time | Nil

    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "ComplianceSeverity", converter: AS::AssociationComplianceSeverity)]
    property compliance_severity : AssociationComplianceSeverity | Nil

    @[JSON::Field(key: "SyncCompliance", converter: AS::AssociationSyncCompliance)]
    property sync_compliance : AssociationSyncCompliance | Nil

    @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
    property apply_only_at_cron_interval : Bool | Nil

    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String) | Nil

    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @date : Time | Nil = nil,
      @last_update_association_date : Time | Nil = nil,
      @status : AssociationStatus | Nil = nil,
      @overview : AssociationOverview | Nil = nil,
      @document_version : String | Nil = nil,
      @automation_target_parameter_name : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @association_id : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @output_location : InstanceAssociationOutputLocation | Nil = nil,
      @last_execution_date : Time | Nil = nil,
      @last_successful_execution_date : Time | Nil = nil,
      @association_name : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @compliance_severity : AssociationComplianceSeverity | Nil = nil,
      @sync_compliance : AssociationSyncCompliance | Nil = nil,
      @apply_only_at_cron_interval : Bool | Nil = nil,
      @calendar_names : Array(String) | Nil = nil,
      @target_locations : Array(TargetLocation) | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil
    )
    end
  end
end
