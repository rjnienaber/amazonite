private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @inventory_deletions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@inventory_deletions, @next_token)
  end
end
