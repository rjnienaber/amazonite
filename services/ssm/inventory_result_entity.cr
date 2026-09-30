private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Inventory query results.
  class InventoryResultEntity
    include JSON::Serializable

    # ID of the inventory result entity. For example, for managed node inventory the result will be
    # the managed node ID. For EC2 instance inventory, the result will be the instance ID.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The data section in the inventory result entity JSON.
    @[JSON::Field(key: "Data")]
    property data : Hash(String, InventoryResultItem) | Nil

    def initialize(
      @id : String | Nil = nil,
      @data : Hash(String, InventoryResultItem) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @data
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@id, @data)
  end
end
