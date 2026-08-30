module Amazonite::CloudWatchLogsV1
  class ListScheduledQueriesResponse
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # An array of scheduled query summary information.
    @[JSON::Field(key: "scheduledQueries")]
    property scheduled_queries : Array(ScheduledQuerySummary) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @scheduled_queries : Array(ScheduledQuerySummary) | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @scheduled_queries)
  end
end
