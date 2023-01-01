module Amazonite::SsmV1
  class InventoryDeletionSummaryItem
    include JSON::Serializable

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "Count")]
    property count : Int32 | Nil

    @[JSON::Field(key: "RemainingCount")]
    property remaining_count : Int32 | Nil

    def initialize(
      @version : String | Nil = nil,
      @count : Int32 | Nil = nil,
      @remaining_count : Int32 | Nil = nil
    )
    end
  end
end
