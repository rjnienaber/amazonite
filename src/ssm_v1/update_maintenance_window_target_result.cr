module Amazonite::SsmV1
  class UpdateMaintenanceWindowTargetResult
    include JSON::Serializable

    # The maintenance window ID specified in the update request.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The target ID specified in the update request.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    # The updated targets.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The updated owner.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The updated name.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The updated description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_target_id : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @window_target_id, @targets, @owner_information, @name, @description)
  end
end
