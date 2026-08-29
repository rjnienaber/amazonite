module Amazonite::SsmV1
  class DeleteMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window to delete.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    def initialize(
      @window_id : String,
    )
    end
  end
end
