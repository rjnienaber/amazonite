module Amazonite::CloudWatchV1
  class ListDashboardsOutput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardEntries")]
    property dashboard_entries : Array(DashboardEntry) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @dashboard_entries : Array(DashboardEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
