module Amazonite::SsmV1
  class InventoryItemSchema
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "Attributes")]
    property attributes : Array(InventoryItemAttribute)

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    def initialize(
      @type_name : String,
      @attributes : Array(InventoryItemAttribute),
      @version : String | Nil = nil,
      @display_name : String | Nil = nil
    )
    end
  end
end
