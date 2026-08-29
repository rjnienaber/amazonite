module Amazonite::SsmV1
  class DeregisterTargetFromMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window the target should be removed from.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The ID of the target definition to remove.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String

    # The system checks if the target is being referenced by a task. If the target is being
    # referenced, the system returns an error and doesn't deregister the target from the maintenance
    # window.
    @[JSON::Field(key: "Safe")]
    property safe : Bool | Nil

    def initialize(
      @window_id : String,
      @window_target_id : String,
      @safe : Bool | Nil = nil,
    )
    end
  end
end
