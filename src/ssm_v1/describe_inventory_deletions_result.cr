module Amazonite::SsmV1
  class DescribeInventoryDeletionsResult
    include JSON::Serializable

    @[JSON::Field(key: "InventoryDeletions")]
    property inventory_deletions : Array(InventoryDeletionStatusItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @inventory_deletions : Array(InventoryDeletionStatusItem) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
