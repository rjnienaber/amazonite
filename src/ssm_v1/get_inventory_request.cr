module Amazonite::SsmV1
  class GetInventoryRequest
    include JSON::Serializable

    # One or more filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) | Nil

    # Returns counts of inventory types based on one or more expressions. For example, if you
    # aggregate by using an expression that uses the `AWS:InstanceInformation.PlatformType` type, you
    # can see a count of how many Windows and Linux managed nodes exist in your inventoried fleet.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(InventoryAggregator) | Nil

    # The list of inventory item types to return.
    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(ResultAttribute) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(InventoryFilter) | Nil = nil,
      @aggregators : Array(InventoryAggregator) | Nil = nil,
      @result_attributes : Array(ResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
