module Amazonite::CloudWatchV1
  class ListDashboardsInput
    include JSON::Serializable

    @[JSON::Field(key: "DashboardNamePrefix")]
    property dashboard_name_prefix : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @dashboard_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
