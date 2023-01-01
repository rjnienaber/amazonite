module Amazonite::SsmV1
  class MaintenanceWindowIdentityForTarget
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil
    )
    end
  end
end
