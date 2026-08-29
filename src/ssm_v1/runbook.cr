module Amazonite::SsmV1
  # Information about an Automation runbook used in a runbook workflow in Change Manager.
  #
  # The Automation runbooks specified for the runbook workflow can't run until all required
  # approvals for the change request have been received.
  class Runbook
    include JSON::Serializable

    # The name of the Automation runbook used in a runbook workflow.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    # The version of the Automation runbook used in a runbook workflow.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The key-value map of execution parameters, which were supplied when calling
    # `StartChangeRequestExecution`.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The name of the parameter used as the target resource for the rate-controlled runbook workflow.
    # Required if you specify `Targets`.
    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    # A key-value mapping to target resources that the runbook operation performs tasks on. Required
    # if you specify `TargetParameterName`.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A key-value mapping of runbook parameters to target resources. Both Targets and TargetMaps can't
    # be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # The `MaxConcurrency` value specified by the user when the operation started, indicating the
    # maximum number of resources that the runbook operation can run on at the same time.
    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    # The `MaxErrors` value specified by the user when the execution started, indicating the maximum
    # number of errors that can occur during the operation before the updates are stopped or rolled
    # back.
    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

    # Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by
    # the current Runbook operation.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    def initialize(
      @document_name : String,
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @target_parameter_name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @max_concurrency : String | Nil = nil,
      @max_errors : String | Nil = nil,
      @target_locations : Array(TargetLocation) | Nil = nil,
    )
    end
  end
end
