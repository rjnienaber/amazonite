module Amazonite::SsmV1
  class UpdateMaintenanceWindowTargetRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

    def initialize(
      @window_id : String,
      @window_target_id : String,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @replace : Bool | Nil = nil
    )
    end
  end
end
