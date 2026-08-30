module Amazonite::SsmV1
  class ListOpsItemEventsResponse
    include JSON::Serializable

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # A list of event information for the specified OpsItems.
    @[JSON::Field(key: "Summaries")]
    property summaries : Array(OpsItemEventSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @summaries : Array(OpsItemEventSummary) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @summaries)
  end
end
