module Amazonite::SsmV1
  class Runbook
    include JSON::Serializable

    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "TargetParameterName")]
    property target_parameter_name : String | Nil

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    @[JSON::Field(key: "MaxConcurrency")]
    property max_concurrency : String | Nil

    @[JSON::Field(key: "MaxErrors")]
    property max_errors : String | Nil

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
      @target_locations : Array(TargetLocation) | Nil = nil
    )
    end
  end
end
