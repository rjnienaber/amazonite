module Amazonite::SsmV1
  class DeregisterTargetFromMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String

    @[JSON::Field(key: "Safe")]
    property safe : Bool | Nil

    def initialize(
      @window_id : String,
      @window_target_id : String,
      @safe : Bool | Nil = nil
    )
    end
  end
end
