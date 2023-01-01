module Amazonite::SsmV1
  class InventoryResultEntity
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Data")]
    property data : Hash(String, InventoryResultItem) | Nil

    def initialize(
      @id : String | Nil = nil,
      @data : Hash(String, InventoryResultItem) | Nil = nil
    )
    end
  end
end
