private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeQueriesRequest
    include JSON::Serializable

    # Limits the returned queries to only those for the specified log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # Limits the returned queries to only those that have the specified status. Valid values are
    # `Cancelled`, `Complete`, `Failed`, `Running`, and `Scheduled`.
    @[JSON::Field(key: "status", converter: ACWL::QueryStatus)]
    property status : QueryStatus | Nil

    # Limits the number of returned queries to the specified number.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Limits the returned queries to only the queries that use the specified query language.
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @status : QueryStatus | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @query_language : QueryLanguage | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @status, @max_results, @next_token, @query_language)
  end
end
