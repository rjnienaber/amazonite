private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the association version.
  class AssociationVersionInfo
    include JSON::Serializable

    # The ID created by the system when the association was created.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The association version.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The date the association version was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The name specified when the association was created.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The version of an Amazon Web Services Systems Manager document (SSM document) used when the
    # association version was created.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Parameters specified when the association version was created.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The targets specified for the association when the association version was created.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The cron or rate schedule specified for the association when the association version was
    # created.
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # The location in Amazon S3 specified for the association when the association version was
    # created.
    @[JSON::Field(key: "OutputLocation")]
    property output_location : InstanceAssociationOutputLocation | Nil

    # The name specified for the association version when the association version was created.
    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    # The number of errors that are allowed before the system stops sending requests to run the
    # association on additional targets. You can specify either an absolute number of errors, for
    # example 10, or a percentage of the target set, for example 10%. If you specify 3, for example,
    # the system stops sending requests when the fourth error is received. If you specify 0, then the
    # system stops sending requests after the first error is returned. If you run an association on 50
    # managed nodes and set `MaxError` to 10%, then the system stops sending the request when the
    # sixth error is received.
    #
    # Executions that are already running an association when `MaxErrors` is reached are allowed to
    # complete, but some of these executions may fail as well. If you need to ensure that there won't
    # be more than max-errors failed executions, set `MaxConcurrency` to 1 so that executions proceed
    # one at a time.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # The maximum number of targets allowed to run the association at the same time. You can specify a
    # number, for example 10, or a percentage of the target set, for example 10%. The default value is
    # 100%, which means all targets run the association at the same time.
    #
    # If a new managed node starts and attempts to run an association while Systems Manager is running
    # `MaxConcurrency` associations, the association is allowed to run. During the next association
    # interval, the new managed node will process its association within the limit specified for
    # `MaxConcurrency`.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The severity level that is assigned to the association.
    @[JSON::Field(key: "ComplianceSeverity", converter: AS::AssociationComplianceSeverity)]
    property compliance_severity : AssociationComplianceSeverity | Nil

    # The mode for generating association compliance. You can specify `AUTO` or `MANUAL`. In `AUTO`
    # mode, the system uses the status of the association execution to determine the compliance
    # status. If the association execution runs successfully, then the association is `COMPLIANT`. If
    # the association execution doesn't run successfully, the association is `NON-COMPLIANT`.
    #
    # In `MANUAL` mode, you must specify the `AssociationId` as a parameter for the PutComplianceItems
    # API operation. In this case, compliance data isn't managed by State Manager, a tool in Amazon
    # Web Services Systems Manager. It is managed by your direct call to the PutComplianceItems API
    # operation.
    #
    # By default, all associations use `AUTO` mode.
    @[JSON::Field(key: "SyncCompliance", converter: AS::AssociationSyncCompliance)]
    property sync_compliance : AssociationSyncCompliance | Nil

    # By default, when you create new associations, the system runs it immediately after it is created
    # and then according to the schedule you specified. Specify this option if you don't want an
    # association to run immediately after you create it. This parameter isn't supported for rate
    # expressions.
    @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
    property apply_only_at_cron_interval : Bool | Nil

    # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your
    # associations are gated under. The associations for this version only run when that Change
    # Calendar is open. For more information, see [Amazon Web Services Systems Manager Change
    # Calendar](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String) | Nil

    # The combination of Amazon Web Services Regions and Amazon Web Services accounts where you wanted
    # to run the association when this association version was created.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    # Number of days to wait after the scheduled day to run an association.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The number of hours that an association can run on specified targets. After the resulting cutoff
    # time passes, associations that are currently running are cancelled, and no pending executions
    # are started on remaining targets.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps
    # can't be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # A role used by association to take actions on your behalf. State Manager will assume this role
    # and call required APIs when dispatching configurations to nodes. If not specified, [
    # service-linked role for Systems
    # Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html)
    # will be used by default.
    @[JSON::Field(key: "AssociationDispatchAssumeRole")]
    property association_dispatch_assume_role : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
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
      @duration : Int32 | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @association_dispatch_assume_role : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_id, @association_version, @created_date, @name, @document_version, @parameters, @targets, @schedule_expression, @output_location, @association_name, @max_errors, @max_concurrency, @compliance_severity, @sync_compliance, @apply_only_at_cron_interval, @calendar_names, @target_locations, @schedule_offset, @duration, @target_maps, @association_dispatch_assume_role)
  end
end
