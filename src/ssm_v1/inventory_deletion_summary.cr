module Amazonite::SsmV1
  class InventoryDeletionSummary
    include JSON::Serializable

    @[JSON::Field(key: "TotalCount")]
    property total_count : Int32 | Nil

    @[JSON::Field(key: "RemainingCount")]
    property remaining_count : Int32 | Nil

    @[JSON::Field(key: "SummaryItems")]
    property summary_items : Array(InventoryDeletionSummaryItem) | Nil

    def initialize(
      @total_count : Int32 | Nil = nil,
      @remaining_count : Int32 | Nil = nil,
      @summary_items : Array(InventoryDeletionSummaryItem) | Nil = nil
    )
    end
  end
end
