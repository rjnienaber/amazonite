module Amazonite::CloudWatchV1
  class ListDashboardsOutput
    include JSON::Serializable

    # The list of matching dashboards.
    @[JSON::Field(key: "DashboardEntries")]
    property dashboard_entries : Array(DashboardEntry) | Nil

    # The token that marks the start of the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @dashboard_entries : Array(DashboardEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
