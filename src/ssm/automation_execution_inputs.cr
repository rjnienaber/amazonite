private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
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
        raise Core::ValidationError.new("Targets must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @target_maps
        raise Core::ValidationError.new("TargetMaps must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TargetMaps must have at most 300 item(s)") if value.size > 300
      end

      if value = @target_locations
        raise Core::ValidationError.new("TargetLocations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TargetLocations must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @target_locations_url
        raise Core::ValidationError.new("TargetLocationsURL does not match the required pattern") unless value.matches?(Regex.new("^https:\\/\\/[-a-zA-Z0-9@:%._\\+~#=]{1,253}\\.s3(\\.[a-z\\d-]{9,16})?\\.amazonaws\\.com\\/.{1,2000}$"))
      end
    end

    def_equals_and_hash(@parameters, @target_parameter_name, @targets, @target_maps, @target_locations, @target_locations_url)
  end
end
