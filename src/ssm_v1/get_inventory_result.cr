module Amazonite::SsmV1
  class GetInventoryResult
    include JSON::Serializable

    @[JSON::Field(key: "Entities")]
    property entities : Array(InventoryResultEntity) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @entities : Array(InventoryResultEntity) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
