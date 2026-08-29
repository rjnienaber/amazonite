module Amazonite::CloudWatchV1
  class DeleteDashboardsInput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardNames")]
    property dashboard_names : Array(String) = [] of String

    def initialize(
      @dashboard_names : Array(String),
    )
    end
  end
end
