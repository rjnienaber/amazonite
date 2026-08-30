module Amazonite::SsmV1
  class DeleteMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the deleted maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id)
  end
end
