private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class StartAutomationExecutionRequest
    include JSON::Serializable

    # The name of the SSM document to run. This can be a public document or a custom document. To run
    # a shared document belonging to another account, specify the document ARN. For more information
    # about how to use shared documents, see [Sharing SSM
    # documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-ssm-sharing.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    # The version of the Automation runbook to use for this execution.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # A key-value map of execution parameters, which match the declared parameters in the Automation
    # runbook.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # User-provided idempotency token. The token must be unique, is case insensitive, enforces the
    # UUID format, and can't be reused.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # The execution mode of the automation. Valid modes include the following: Auto and Interactive.
    # The default mode is Auto.
    @[JSON::Field(key: "Mode", converter: AS::ExecutionMode)]
    property mode : ExecutionMode | Nil

    # The name of the parameter used as the target resource for the rate-controlled execution.
    # Required if you specify targets.
    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    # A key-value mapping to target resources. Required if you specify TargetParameterName.
    #
    # If both this parameter and the `TargetLocation:Targets` parameter are supplied,
    # `TargetLocation:Targets` takes precedence.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps
    # can't be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # The maximum number of targets allowed to run this task in parallel. You can specify a number,
    # such as 10, or a percentage, such as 10%. The default value is `10`.
    #
    # If both this parameter and the `TargetLocation:TargetsMaxConcurrency` are supplied,
    # `TargetLocation:TargetsMaxConcurrency` takes precedence.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The number of errors that are allowed before the system stops running the automation on
    # additional targets. You can specify either an absolute number of errors, for example 10, or a
    # percentage of the target set, for example 10%. If you specify 3, for example, the system stops
    # running the automation when the fourth error is received. If you specify 0, then the system
    # stops running the automation on additional targets after the first error result is returned. If
    # you run an automation on 50 resources and set max-errors to 10%, then the system stops running
    # the automation on additional targets when the sixth error is received.
    #
    # Executions that are already running an automation when max-errors is reached are allowed to
    # complete, but some of these executions may fail as well. If you need to ensure that there won't
    # be more than max-errors failed executions, set max-concurrency to 1 so the executions proceed
    # one at a time.
    #
    # If this parameter and the `TargetLocation:TargetsMaxErrors` parameter are both supplied,
    # `TargetLocation:TargetsMaxErrors` takes precedence.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # A location is a combination of Amazon Web Services Regions and/or Amazon Web Services accounts
    # where you want to run the automation. Use this operation to start an automation in multiple
    # Amazon Web Services Regions and multiple Amazon Web Services accounts. For more information, see
    # [Running automations in multiple Amazon Web Services Regions and
    # accounts](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    # Optional metadata that you assign to a resource. You can specify a maximum of five tags for an
    # automation. Tags enable you to categorize a resource in different ways, such as by purpose,
    # owner, or environment. For example, you might want to tag an automation to identify an
    # environment or operating system. In this case, you could specify the following key-value pairs:
    #
    # - `Key=environment,Value=test`
    #
    # - `Key=OS,Value=Windows`
    #
    # The `Array Members` maximum value is reported as 1000. This number includes capacity reserved
    # for internal operations. When calling the `StartAutomationExecution` action, you can specify a
    # maximum of 5 tags. You can, however, use the AddTagsToResource action to add up to a total of 50
    # tags to an existing automation configuration.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The CloudWatch alarm you want to apply to your automation.
    @[JSON::Field(key: "AlarmConfiguration")]
    property alarm_configuration : AlarmConfiguration | Nil

    # Specify a publicly accessible URL for a file that contains the `TargetLocations` body.
    # Currently, only files in presigned Amazon S3 buckets are supported.
    @[JSON::Field(key: "TargetLocationsURL")]
    property target_locations_url : String | Nil

    def initialize(
      @document_name : String,
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @client_token : String | Nil = nil,
      @mode : ExecutionMode | Nil = nil,
      @target_parameter_name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target_locations : Array(TargetLocation) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @alarm_configuration : AlarmConfiguration | Nil = nil,
      @target_locations_url : String | Nil = nil,
    )
    end

    def_equals_and_hash(@document_name, @document_version, @parameters, @client_token, @mode, @target_parameter_name, @targets, @target_maps, @max_concurrency, @max_errors, @target_locations, @tags, @alarm_configuration, @target_locations_url)
  end
end
