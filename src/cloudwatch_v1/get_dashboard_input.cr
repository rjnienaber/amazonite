module Amazonite::CloudWatchV1
  class GetDashboardInput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String

    def initialize(
      @dashboard_name : String,
    )
    end
  end
end
