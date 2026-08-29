module Amazonite::SsmV1
  class CreateMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the created maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
    )
    end
  end
end
