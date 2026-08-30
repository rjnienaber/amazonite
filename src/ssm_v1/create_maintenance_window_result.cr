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

    def_equals_and_hash(@window_id)
  end
end
