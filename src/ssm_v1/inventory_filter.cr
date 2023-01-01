private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InventoryFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Type", converter: AS::InventoryQueryOperatorType)]
    property type : InventoryQueryOperatorType | Nil

    def initialize(
      @key : String,
      @values : Array(String),
      @type : InventoryQueryOperatorType | Nil = nil
    )
    end
  end
end
