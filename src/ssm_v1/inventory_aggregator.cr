module Amazonite::SsmV1
  # Specifies the inventory type and attribute for the aggregation execution.
  class InventoryAggregator
    include JSON::Serializable

    # The inventory type and attribute name for aggregation.
    @[JSON::Field(key: "Expression")]
    property expression : String | Nil

    # Nested aggregators to further refine aggregation for an inventory type.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(InventoryAggregator) | Nil

    # A user-defined set of one or more filters on which to aggregate inventory data. Groups return a
    # count of resources that match and don't match the specified criteria.
    @[JSON::Field(key: "Groups")]
    property groups : Array(InventoryGroup) | Nil

    def initialize(
      @expression : String | Nil = nil,
      @aggregators : Array(InventoryAggregator) | Nil = nil,
      @groups : Array(InventoryGroup) | Nil = nil,
    )
    end

    def_equals_and_hash(@expression, @aggregators, @groups)
  end
end
