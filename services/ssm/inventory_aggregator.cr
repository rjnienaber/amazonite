private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @expression
        raise Core::ValidationError.new("Expression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Expression length must be <= 1000") if value.size > 1000
      end

      if value = @aggregators
        raise Core::ValidationError.new("Aggregators must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Aggregators must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @groups
        raise Core::ValidationError.new("Groups must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Groups must have at most 15 item(s)") if value.size > 15
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@expression, @aggregators, @groups)
  end
end
