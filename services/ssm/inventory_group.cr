private alias Core = Amazonite::Core

module Amazonite::Ssm
  # A user-defined set of one or more filters on which to aggregate inventory data. Groups return a
  # count of resources that match and don't match the specified criteria.
  class InventoryGroup
    include JSON::Serializable

    # The name of the group.
    @[JSON::Field(key: "Name")]
    property name : String

    # Filters define the criteria for the group. The `matchingCount` field displays the number of
    # resources that match the criteria. The `notMatchingCount` field displays the number of resources
    # that don't match the criteria.
    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) = [] of InventoryFilter

    def initialize(
      @name : String,
      @filters : Array(InventoryFilter),
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 200") if value.size > 200
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@name, @filters)
  end
end
