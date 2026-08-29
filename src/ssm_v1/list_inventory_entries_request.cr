module Amazonite::SsmV1
  class ListInventoryEntriesRequest
    include JSON::Serializable

    # The managed node ID for which you want inventory information.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The type of inventory item for which you want information.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # One or more filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(InventoryFilter) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @instance_id : String,
      @type_name : String,
      @filters : Array(InventoryFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
