module Amazonite::SsmV1
  class ListOpsItemRelatedItemsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Summaries")]
    property summaries : Array(OpsItemRelatedItemSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @summaries : Array(OpsItemRelatedItemSummary) | Nil = nil
    )
    end
  end
end
