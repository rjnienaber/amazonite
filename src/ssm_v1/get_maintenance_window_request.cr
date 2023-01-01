module Amazonite::SsmV1
  class GetMaintenanceWindowRequest
    include JSON::Serializable

    @[JSON::Field(key: "WindowId")]
    property window_id : String

    def initialize(
      @window_id : String
    )
    end
  end
end
