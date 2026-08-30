module Amazonite::CloudWatchV1
  class DeleteDashboardsInput
    include JSON::Serializable

    # The dashboards to be deleted. This parameter is required.
    @[JSON::Field(key: "DashboardNames")]
    property dashboard_names : Array(String) = [] of String

    def initialize(
      @dashboard_names : Array(String),
    )
    end

    def_equals_and_hash(@dashboard_names)
  end
end
