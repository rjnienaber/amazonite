module Amazonite::SsmV1
  class RegisterTargetWithMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the target definition in this maintenance window.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    def initialize(
      @window_target_id : String | Nil = nil,
    )
    end
  end
end
