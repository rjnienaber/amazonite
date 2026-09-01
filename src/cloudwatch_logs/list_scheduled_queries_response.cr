private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @scheduled_queries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @scheduled_queries)
  end
end
