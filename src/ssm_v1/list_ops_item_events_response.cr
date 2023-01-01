module Amazonite::SsmV1
  class ListOpsItemEventsResponse
    include JSON::Serializable

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Summaries")]
    property summaries : Array(OpsItemEventSummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @summaries : Array(OpsItemEventSummary) | Nil = nil
    )
    end
  end
end
