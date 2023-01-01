module Amazonite::SsmV1
  class GetInventorySchemaResult
    include JSON::Serializable

    @[JSON::Field(key: "Schemas")]
    property schemas : Array(InventoryItemSchema) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @schemas : Array(InventoryItemSchema) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
