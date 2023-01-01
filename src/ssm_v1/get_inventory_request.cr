module Amazonite::SsmV1
  class GetInventoryRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) | Nil

    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(InventoryAggregator) | Nil

    @[JSON::Field(key: "ResultAttributes")]
    property result_attributes : Array(ResultAttribute) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(InventoryFilter) | Nil = nil,
      @aggregators : Array(InventoryAggregator) | Nil = nil,
      @result_attributes : Array(ResultAttribute) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
