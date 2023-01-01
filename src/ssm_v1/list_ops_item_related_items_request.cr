module Amazonite::SsmV1
  class ListOpsItemRelatedItemsRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsItemRelatedItemsFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @filters : Array(OpsItemRelatedItemsFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
