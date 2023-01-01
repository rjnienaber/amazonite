module Amazonite::SsmV1
  class CreateMaintenanceWindowResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil
    )
    end
  end
end
