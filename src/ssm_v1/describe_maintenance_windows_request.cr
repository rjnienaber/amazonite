module Amazonite::SsmV1
  class DescribeMaintenanceWindowsRequest
    include JSON::Serializable

    # Optional filters used to narrow down the scope of the returned maintenance windows. Supported
    # filter keys are `Name` and `Enabled`. For example, `Name=MyMaintenanceWindow` and
    # `Enabled=True`.
    @[JSON::Field(key: "Filters")]
    property filters : Array(MaintenanceWindowFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @filters : Array(MaintenanceWindowFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
