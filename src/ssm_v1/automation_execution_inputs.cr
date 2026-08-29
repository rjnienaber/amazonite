module Amazonite::SsmV1
  class AutomationExecutionInputs
    include JSON::Serializable

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    @[JSON::Field(key: "TargetLocations")]
    property target_locations : Array(TargetLocation) | Nil

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
