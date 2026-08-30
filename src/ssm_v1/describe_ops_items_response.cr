module Amazonite::SsmV1
  class DescribeOpsItemsResponse
    include JSON::Serializable

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # A list of OpsItems.
    @[JSON::Field(key: "OpsItemSummaries")]
    property ops_item_summaries : Array(OpsItemSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ops_item_summaries : Array(OpsItemSummary) | Nil = nil,
    )
    end
  end
end
