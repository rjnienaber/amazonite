module Amazonite::CloudWatchV1
  class GetDashboardInput
    include JSON::Serializable

    # The name of the dashboard to be described.
    @[JSON::Field(key: "DashboardName")]
    property dashboard_name : String

    def initialize(
      @dashboard_name : String,
    )
    end
  end
end
