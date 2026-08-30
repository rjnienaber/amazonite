private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateAssociationRequest
    include JSON::Serializable

    # The ID of the association you want to update.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    # The parameters you want to update for the association. If you create a parameter using Parameter
    # Store, a tool in Amazon Web Services Systems Manager, you can reference the parameter using
    # `{{ssm:parameter-name}}`.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The document version you want update for the association.
    #
    # State Manager doesn't support running associations that use a new version of a document if that
    # document is shared from another account. State Manager always runs the `default` version of a
    # document if shared from another account, even though the Systems Manager console shows that a
    # new version was processed. If you want to run an association using a new version of a document
    # shared form another account, you must set the document version to `default`.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The cron expression used to schedule the association that you want to update.
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # An S3 bucket where you want to store the results of this request.
    @[JSON::Field(key: "OutputLocation")]
    property output_location : InstanceAssociationOutputLocation | Nil

    # The name of the SSM Command document or Automation runbook that contains the configuration
    # information for the managed node.
    #
    # You can specify Amazon Web Services-predefined documents, documents you created, or a document
    # that is shared with you from another account.
    #
    # For Systems Manager document (SSM document) that are shared with you from other Amazon Web
    # Services accounts, you must specify the complete SSM document ARN, in the following format:
    #
    # `arn:aws:ssm:*region*:*account-id*:document/*document-name* `
    #
    # For example:
    #
    # `arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document`
    #
    # For Amazon Web Services-predefined documents and SSM documents you created in your account, you
    # only need to specify the document name. For example, `AWS-ApplyPatchBaseline` or `My-Document`.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The targets of the association.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The name of the association that you want to update.
    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    # This parameter is provided for concurrency control purposes. You must specify the latest
    # association version in the service. If you want to ensure that this request succeeds, either
    # specify `$LATEST`, or omit this parameter.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # Choose the parameter that will define how your automation will branch out. This target is
    # required for associations that use an Automation runbook and target resources by using rate
    # controls. Automation is a tool in Amazon Web Services Systems Manager.
    @[JSON::Field(key: "AutomationTargetParameterName")]
    property automation_target_parameter_name : String | Nil

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

    # The severity level to assign to the association.
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

    # By default, when you update an association, the system runs it immediately after it is updated
    # and then according to the schedule you specified. Specify `true` for `ApplyOnlyAtCronInterval`
    # if you want the association to run only according to the schedule you specified.
    #
    # If you chose this option when you created an association and later you edit that association or
    # you make changes to the Automation runbook or SSM document on which that association is based,
    # State Manager applies the association at the next specified cron interval. For example, if you
    # chose the `Latest` version of an SSM document when you created an association and you edit the
    # association by choosing a different document version on the Documents page, State Manager
    # applies the association at the next specified cron interval if you previously set
    # `ApplyOnlyAtCronInterval` to `true`. If this option wasn't selected, State Manager immediately
    # runs the association.
    #
    # For more information, see [Understanding when associations are applied to
    # resources](https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#state-manager-about-scheduling)
    # and [About target updates with Automation
    # runbooks](https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#runbook-target-updates)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # This parameter isn't supported for rate expressions.
    #
    # You can reset this parameter. To do so, specify the `no-apply-only-at-cron-interval` parameter
    # when you update the association from the command line. This parameter forces the association to
    # run immediately after updating it and according to the interval specified.
    @[JSON::Field(key: "ApplyOnlyAtCronInterval")]
    property apply_only_at_cron_interval : Bool | Nil

    # The names or Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate
    # your associations under. The associations only run when that change calendar is open. For more
    # information, see [Amazon Web Services Systems Manager Change
    # Calendar](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "CalendarNames")]
    property calendar_names : Array(String) | Nil

    # A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts
    # where you want to run the association. Use this action to update an association in multiple
    # Regions and multiple accounts.
    #
    # The `TargetLocationAlarmConfiguration` parameter is not supported by State Manager.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    # Number of days to wait after the scheduled day to run an association. For example, if you
    # specified a cron schedule of `cron(0 0 ? * THU#2 *)`, you could specify an offset of 3 to run
    # the association each Sunday after the second Thursday of the month. For more information about
    # cron schedules for associations, see [Reference: Cron and rate expressions for Systems
    # Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/reference-cron-and-rate-expressions.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # To use offsets, you must specify the `ApplyOnlyAtCronInterval` parameter. This option tells the
    # system not to run an association immediately after you create it.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The number of hours the association can run before it is canceled. Duration applies to
    # associations that are currently running, and any pending and in progress commands on all
    # targets. If a target was taken offline for the association to run, it is made available again
    # immediately, without a reboot.
    #
    # The `Duration` parameter applies only when both these conditions are true:
    #
    # - The association for which you specify a duration is cancelable according to the parameters of
    # the SSM command document or Automation runbook associated with this execution.
    #
    # - The command specifies the `
    # [ApplyOnlyAtCronInterval](https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_UpdateAssociation.html#systemsmanager-UpdateAssociation-request-ApplyOnlyAtCronInterval)
    # ` parameter, which means that the association doesn't run immediately after it is updated, but
    # only according to the specified schedule.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps
    # can't be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # A role used by association to take actions on your behalf. State Manager will assume this role
    # and call required APIs when dispatching configurations to nodes. If not specified, [
    # service-linked role for Systems
    # Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html)
    # will be used by default.
    #
    # It is recommended that you define a custom IAM role so that you have full control of the
    # permissions that State Manager has when taking actions on your behalf.
    #
    # Service-linked role support in State Manager is being phased out. Associations relying on
    # service-linked role may require updates in the future to continue functioning properly.
    @[JSON::Field(key: "AssociationDispatchAssumeRole")]
    property association_dispatch_assume_role : String | Nil

    def initialize(
      @association_id : String,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @document_version : String | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @output_location : InstanceAssociationOutputLocation | Nil = nil,
      @name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @association_name : String | Nil = nil,
      @association_version : String | Nil = nil,
      @automation_target_parameter_name : String | Nil = nil,
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
      @association_dispatch_assume_role : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @output_location
        value.validate!
      end

      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @association_name
        raise Core::ValidationError.new("AssociationName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end

      if value = @automation_target_parameter_name
        raise Core::ValidationError.new("AutomationTargetParameterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AutomationTargetParameterName length must be <= 50") if value.size > 50
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

      if value = @association_dispatch_assume_role
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AssociationDispatchAssumeRole length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("AssociationDispatchAssumeRole does not match the required pattern") unless value.matches?(Regex.new("^arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+$"))
      end
    end

    def_equals_and_hash(@association_id, @parameters, @document_version, @schedule_expression, @output_location, @name, @targets, @association_name, @association_version, @automation_target_parameter_name, @max_errors, @max_concurrency, @compliance_severity, @sync_compliance, @apply_only_at_cron_interval, @calendar_names, @target_locations, @schedule_offset, @duration, @target_maps, @alarm_configuration, @association_dispatch_assume_role)
  end
end
