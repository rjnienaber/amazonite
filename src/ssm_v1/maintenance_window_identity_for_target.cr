module Amazonite::SsmV1
  # The maintenance window to which the specified target belongs.
  class MaintenanceWindowIdentityForTarget
    include JSON::Serializable

    # The ID of the maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end
  end
end
