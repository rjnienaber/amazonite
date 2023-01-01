private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class CreateAssociationBatchRequestEntry
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "AutomationTargetParameterName")]
    property automation_target_parameter_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    @[JSON::Field(key: "OutputLocation")]
    property output_location : InstanceAssociationOutputLocation | Nil

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

    def initialize(
      @name : String,
      @instance_id : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @automation_target_parameter_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @output_location : InstanceAssociationOutputLocation | Nil = nil,
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
      @alarm_configuration : AlarmConfiguration | Nil = nil
    )
    end
  end
end
