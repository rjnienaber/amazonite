module Amazonite::CloudWatchLogsV1
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

    def_equals_and_hash(@queries, @next_token)
  end
end
