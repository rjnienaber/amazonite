private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Either a count, remaining count, or a version number in a delete inventory summary.
  class InventoryDeletionSummaryItem
    include JSON::Serializable

    # The inventory type version.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # A count of the number of deleted items.
    @[JSON::Field(key: "Count")]
    property count : Int32 | Nil

    # The remaining number of items to delete.
    @[JSON::Field(key: "RemainingCount")]
    property remaining_count : Int32 | Nil

    def initialize(
      @version : String | Nil = nil,
      @count : Int32 | Nil = nil,
      @remaining_count : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @version
        raise Core::ValidationError.new("Version does not match the required pattern") unless value.matches?(Regex.new("^([0-9]{1,6})(\\.[0-9]{1,6})$"))
      end
    end

    def_equals_and_hash(@version, @count, @remaining_count)
  end
end
