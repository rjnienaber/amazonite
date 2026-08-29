module Amazonite::SsmV1
  # Information about the optional inputs that can be specified for an automation execution preview.
  class AutomationExecutionInputs
    include JSON::Serializable

    # Information about parameters that can be specified for the preview operation.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The name of the parameter used as the target resource for the rate-controlled execution.
    # Required if you specify targets.
    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    # Information about the resources that would be included in the actual runbook execution, if it
    # were to be run. Both Targets and TargetMaps can't be specified together.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps
    # can't be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    # Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by
    # the Automation execution preview operation.
    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

    # A publicly accessible URL for a file that contains the `TargetLocations` body. Currently, only
    # files in presigned Amazon S3 buckets are supported.
    @[JSON::Field(key: "TargetLocationsURL")]
    property target_locations_url : String | Nil

    def initialize(
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @target_parameter_name : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
      @target_locations : Array(TargetLocation) | Nil = nil,
      @target_locations_url : String | Nil = nil,
    )
    end
  end
end
