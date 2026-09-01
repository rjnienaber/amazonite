private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeQueriesResponse
    include JSON::Serializable

    # The list of queries that match the request.
    @[JSON::Field(key: "queries")]
    property queries : Array(QueryInfo) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @queries : Array(QueryInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @queries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@queries, @next_token)
  end
end
