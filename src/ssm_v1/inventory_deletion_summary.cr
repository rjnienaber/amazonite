module Amazonite::SsmV1
  # Information about the delete operation.
  class InventoryDeletionSummary
    include JSON::Serializable

    # The total number of items to delete. This count doesn't change during the delete operation.
    @[JSON::Field(key: "TotalCount")]
    property total_count : Int32 | Nil

    # Remaining number of items to delete.
    @[JSON::Field(key: "RemainingCount")]
    property remaining_count : Int32 | Nil

    # A list of counts and versions for deleted items.
    @[JSON::Field(key: "SummaryItems")]
    property summary_items : Array(InventoryDeletionSummaryItem) | Nil

    def initialize(
      @total_count : Int32 | Nil = nil,
      @remaining_count : Int32 | Nil = nil,
      @summary_items : Array(InventoryDeletionSummaryItem) | Nil = nil,
    )
    end

    def_equals_and_hash(@total_count, @remaining_count, @summary_items)
  end
end
