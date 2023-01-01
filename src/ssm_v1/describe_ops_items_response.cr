module Amazonite::SsmV1
  class DescribeOpsItemsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "OpsItemSummaries")]
    property ops_item_summaries : Array(OpsItemSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ops_item_summaries : Array(OpsItemSummary) | Nil = nil
    )
    end
  end
end
