module Amazonite::SsmV1
  class DescribeMaintenanceWindowTargetsRequest
    include JSON::Serializable

    # The ID of the maintenance window whose targets should be retrieved.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # Optional filters that can be used to narrow down the scope of the returned window targets. The
    # supported filter keys are `Type`, `WindowTargetId`, and `OwnerInformation`.
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
      @window_id : String,
      @filters : Array(MaintenanceWindowFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
