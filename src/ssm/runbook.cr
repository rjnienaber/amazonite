private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @parameters
        raise Core::ValidationError.new("Parameters must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Parameters must have at most 200 entry(s)") if value.size > 200
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
    end

    def_equals_and_hash(@document_name, @document_version, @parameters, @target_parameter_name, @targets, @target_maps, @max_concurrency, @max_errors, @target_locations)
  end
end
