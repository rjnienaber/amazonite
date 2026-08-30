private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes the parameters for a document.
  class AssociationDescription
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The association version.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The date when the association was made.
    @[JSON::Field(key: "Date", converter: Core::AWSEpochConverter)]
    property date : Time | Nil

    # The date when the association was last updated.
    @[JSON::Field(key: "LastUpdateAssociationDate", converter: Core::AWSEpochConverter)]
    property last_update_association_date : Time | Nil

    # The association status.
    @[JSON::Field(key: "Status")]
    property status : AssociationStatus | Nil

    # Information about the association.
    @[JSON::Field(key: "Overview")]
    property overview : AssociationOverview | Nil

    # The document version.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # Choose the parameter that will define how your automation will branch out. This target is
    # required for associations that use an Automation runbook and target resources by using rate
    # controls. Automation is a tool in Amazon Web Services Systems Manager.
    @[JSON::Field(key: "AutomationTargetParameterName")]
    property automation_target_parameter_name : String | Nil

    # A description of the parameters for a document.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The managed nodes targeted by the request.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A cron expression that specifies a schedule when the association runs.
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # An S3 bucket where you want to store the output details of the request.
    @[JSON::Field(key: "OutputLocation")]
    property output_location : InstanceAssociationOutputLocation | Nil

    # The date on which the association was last run.
    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    # The last date on which the association was successfully run.
    @[JSON::Field(key: "LastSuccessfulExecutionDate", converter: Core::AWSEpochConverter)]
    property last_successful_execution_date : Time | Nil

    # The association name.
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

    # By default, when you create a new associations, the system runs it immediately after it is
    # created and then according to the schedule you specified. Specify this option if you don't want
    # an association to run immediately after you create it. This parameter isn't supported for rate
    # expressions.
    @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
    property apply_only_at_cron_interval : Bool | Nil

    # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your
    # associations are gated under. The associations only run when that change calendar is open. For
    # more information, see [Amazon Web Services Systems Manager Change
    # Calendar](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String) | Nil

    # The combination of Amazon Web Services Regions and Amazon Web Services accounts where you want
    # to run the association.
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

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # The CloudWatch alarm that was invoked during the association.
    @[JSON::Field(key: "TriggeredAlarms")]
    property triggered_alarms : Array(AlarmStateInformation) | Nil

    # A role used by association to take actions on your behalf. State Manager will assume this role
    # and call required APIs when dispatching configurations to nodes. If not specified, [
    # service-linked role for Systems
    # Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html)
    # will be used by default.
    @[JSON::Field(key: "AssociationDispatchAssumeRole")]
    property association_dispatch_assume_role : String | Nil

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
      @duration : Int32 | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @triggered_alarms : Array(AlarmStateInformation) | Nil = nil,
      @association_dispatch_assume_role : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end

      if value = @status
        value.validate!
      end

      if value = @overview
        value.validate!
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @automation_target_parameter_name
        raise Core::ValidationError.new("AutomationTargetParameterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AutomationTargetParameterName length must be <= 50") if value.size > 50
      end

      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @output_location
        value.validate!
      end

      if value = @association_name
        raise Core::ValidationError.new("AssociationName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @max_errors
        raise Core::ValidationError.new("MaxErrors length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxErrors length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxErrors does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$"))
      end

      if value = @max_concurrency
        raise Core::ValidationError.new("MaxConcurrency length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxConcurrency length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("MaxConcurrency does not match the required pattern") unless value.matches?(Regex.new("^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$"))
      end

      if value = @target_locations
        raise Core::ValidationError.new("TargetLocations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TargetLocations must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @schedule_offset
        raise Core::ValidationError.new("ScheduleOffset value must be >= 1") if value < 1
        raise Core::ValidationError.new("ScheduleOffset value must be <= 6") if value > 6
      end

      if value = @duration
        raise Core::ValidationError.new("Duration value must be >= 1") if value < 1
        raise Core::ValidationError.new("Duration value must be <= 24") if value > 24
      end

      if value = @target_maps
        raise Core::ValidationError.new("TargetMaps must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TargetMaps must have at most 300 item(s)") if value.size > 300
      end

      if value = @alarm_configuration
        value.validate!
      end

      if value = @triggered_alarms
        raise Core::ValidationError.new("TriggeredAlarms must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TriggeredAlarms must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @association_dispatch_assume_role
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("AssociationDispatchAssumeRole does not match the required pattern") unless value.matches?(Regex.new("^arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+$"))
      end
    end

    def_equals_and_hash(@name, @instance_id, @association_version, @date, @last_update_association_date, @status, @overview, @document_version, @automation_target_parameter_name, @parameters, @association_id, @targets, @schedule_expression, @output_location, @last_execution_date, @last_successful_execution_date, @association_name, @max_errors, @max_concurrency, @compliance_severity, @sync_compliance, @apply_only_at_cron_interval, @calendar_names, @target_locations, @schedule_offset, @duration, @target_maps, @alarm_configuration, @triggered_alarms, @association_dispatch_assume_role)
  end
end
