module Amazonite::SsmV1
  class UpdateMaintenanceWindowTargetRequest
    include JSON::Serializable

    # The maintenance window ID with which to modify the target.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The target ID to modify.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String

    # The targets to add or replace.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # User-provided value that will be included in any Amazon CloudWatch Events events raised while
    # running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # A name for the update.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description for the update.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # If `True`, then all fields that are required by the RegisterTargetWithMaintenanceWindow
    # operation are also required for this API request. Optional fields that aren't specified are set
    # to null.
    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

    def initialize(
      @window_id : String,
      @window_target_id : String,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @replace : Bool | Nil = nil,
    )
    end
  end
end
