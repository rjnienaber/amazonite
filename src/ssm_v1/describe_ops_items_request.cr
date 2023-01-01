module Amazonite::SsmV1
  class DescribeOpsItemsRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemFilters")]
    property ops_item_filters : Array(OpsItemFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_item_filters : Array(OpsItemFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
