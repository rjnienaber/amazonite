module Amazonite::SsmV1
  class InventoryGroup
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter)

    def initialize(
      @name : String,
      @filters : Array(InventoryFilter)
    )
    end
  end
end
