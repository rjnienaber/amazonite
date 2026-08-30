module Amazonite::SsmV1
  # The inventory item schema definition. Users can use this to compose inventory query filters.
  class InventoryItemSchema
    include JSON::Serializable

    # The name of the inventory type. Default inventory item type names start with Amazon Web
    # Services. Custom inventory type names will start with Custom. Default inventory item types
    # include the following: `AWS:AWSComponent`, `AWS:Application`, `AWS:InstanceInformation`,
    # `AWS:Network`, and `AWS:WindowsUpdate`.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # The schema version for the inventory item.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The schema attributes for inventory. This contains data type and attribute name.
    @[JSON::Field(key: "Attributes")]
    property attributes : Array(InventoryItemAttribute) = [] of InventoryItemAttribute

    # The alias name of the inventory type. The alias name is used for display purposes.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    def initialize(
      @type_name : String,
      @attributes : Array(InventoryItemAttribute),
      @version : String | Nil = nil,
      @display_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@type_name, @version, @attributes, @display_name)
  end
end
