private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Attributes are the entries within the inventory item content. It contains name and value.
  class InventoryItemAttribute
    include JSON::Serializable

    # Name of the inventory item attribute.
    @[JSON::Field(key: "Name")]
    property name : String

    # The data type of the inventory item attribute.
    @[JSON::Field(key: "DataType", converter: AS::InventoryAttributeDataType)]
    property data_type : InventoryAttributeDataType

    def initialize(
      @name : String,
      @data_type : InventoryAttributeDataType,
    )
    end
  end
end
