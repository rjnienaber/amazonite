private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetInventoryResult
    include JSON::Serializable

    # Collection of inventory entities such as a collection of managed node inventory.
    @[JSON::Field(key: "Entities")]
    property entities : Array(InventoryResultEntity) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @entities : Array(InventoryResultEntity) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entities, @next_token)
  end
end
