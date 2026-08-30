module Amazonite::CloudWatchV1
  class ListDashboardsInput
    include JSON::Serializable

    # If you specify this parameter, only the dashboards with names starting with the specified string
    # are listed. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, ".", "-", and
    # "_".
    @[JSON::Field(key: "DashboardNamePrefix")]
    property dashboard_name_prefix : String | Nil

    # The token returned by a previous call to indicate that there is more data available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @dashboard_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
