module Amazonite::SsmV1
  class PutInventoryRequest
    include JSON::Serializable

    # An managed node ID where you want to add or update inventory items.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The inventory items that you want to add or update on managed nodes.
    @[JSON::Field(key: "Items")]
    property items : Array(InventoryItem) = [] of InventoryItem

    def initialize(
      @instance_id : String,
      @items : Array(InventoryItem),
    )
    end
  end
end
