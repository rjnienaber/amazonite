module Amazonite::SsmV1
  class ListOpsItemRelatedItemsResponse
    include JSON::Serializable

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # A list of related-item resources for the specified OpsItem.
    @[JSON::Field(key: "Summaries")]
    property summaries : Array(OpsItemRelatedItemSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @summaries : Array(OpsItemRelatedItemSummary) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @summaries)
  end
end
