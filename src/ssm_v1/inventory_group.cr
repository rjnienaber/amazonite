module Amazonite::SsmV1
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

    def_equals_and_hash(@name, @filters)
  end
end
