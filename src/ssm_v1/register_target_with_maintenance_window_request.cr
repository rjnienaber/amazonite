private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class RegisterTargetWithMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target)

    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @window_id : String,
      @resource_type : MaintenanceWindowResourceType,
      @targets : Array(Target),
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil
    )
    end
  end
end
