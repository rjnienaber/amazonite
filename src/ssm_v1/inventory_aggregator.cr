module Amazonite::SsmV1
  class InventoryAggregator
    include JSON::Serializable

    @[JSON::Field(key: "Expression")]
    property expression : String | Nil

    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(InventoryAggregator) | Nil

    @[JSON::Field(key: "Groups")]
    property groups : Array(InventoryGroup) | Nil

    def initialize(
      @expression : String | Nil = nil,
      @aggregators : Array(InventoryAggregator) | Nil = nil,
      @groups : Array(InventoryGroup) | Nil = nil
    )
    end
  end
end
