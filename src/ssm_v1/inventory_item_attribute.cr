private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InventoryItemAttribute
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "DataType", converter: AS::InventoryAttributeDataType)]
    property data_type : InventoryAttributeDataType

    def initialize(
      @name : String,
      @data_type : InventoryAttributeDataType
    )
    end
  end
end
