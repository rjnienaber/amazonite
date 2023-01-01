module Amazonite::SsmV1
  class PutInventoryRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "Items")]
    property items : Array(InventoryItem)

    def initialize(
      @instance_id : String,
      @items : Array(InventoryItem)
    )
    end
  end
end
