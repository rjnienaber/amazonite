module Amazonite::SsmV1
  class GetMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window for which you want to retrieve information.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    def initialize(
      @window_id : String,
    )
    end

    def_equals_and_hash(@window_id)
  end
end
