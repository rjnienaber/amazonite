private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @items
        raise Core::ValidationError.new("Items must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Items must have at most 30 item(s)") if value.size > 30
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_id, @items)
  end
end
