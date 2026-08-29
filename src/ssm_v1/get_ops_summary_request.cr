module Amazonite::SsmV1
  class GetOpsSummaryRequest
    include JSON::Serializable

    # Specify the name of a resource data sync to get.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    # Optional filters used to scope down the returned OpsData.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    # Optional aggregators that return counts of OpsData based on one or more expressions.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    # The OpsData data type to return.
    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(OpsResultAttribute) | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil,
      @result_attributes : Array(OpsResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
