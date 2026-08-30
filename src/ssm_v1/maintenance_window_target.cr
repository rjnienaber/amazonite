private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # The target registered with the maintenance window.
  class MaintenanceWindowTarget
    include JSON::Serializable

    # The ID of the maintenance window to register the target with.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the target.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    # The type of target that is being registered with the maintenance window.
    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType | Nil

    # The targets, either managed nodes or tags.
    #
    # Specify managed nodes using the following format:
    #
    # `Key=instanceids,Values=,`
    #
    # Tags are specified using the following format:
    #
    # `Key=,Values=`.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A user-provided value that will be included in any Amazon CloudWatch Events events that are
    # raised while running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The name for the maintenance window target.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A description for the target.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_target_id : String | Nil = nil,
      @resource_type : MaintenanceWindowResourceType | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @window_target_id, @resource_type, @targets, @owner_information, @name, @description)
  end
end
