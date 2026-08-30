module Amazonite::SsmV1
  class DescribeInventoryDeletionsResult
    include JSON::Serializable

    # A list of status items for deleted inventory.
    @[JSON::Field(key: "InventoryDeletions")]
    property inventory_deletions : Array(InventoryDeletionStatusItem) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @inventory_deletions : Array(InventoryDeletionStatusItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
