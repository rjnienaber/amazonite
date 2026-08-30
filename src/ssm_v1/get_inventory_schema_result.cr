private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetInventorySchemaResult
    include JSON::Serializable

    # Inventory schemas returned by the request.
    @[JSON::Field(key: "Schemas")]
    property schemas : Array(InventoryItemSchema) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @schemas : Array(InventoryItemSchema) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @schemas
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@schemas, @next_token)
  end
end
