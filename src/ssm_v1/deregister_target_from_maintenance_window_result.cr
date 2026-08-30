module Amazonite::SsmV1
  class DeregisterTargetFromMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the maintenance window the target was removed from.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the removed target definition.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_target_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @window_target_id)
  end
end
