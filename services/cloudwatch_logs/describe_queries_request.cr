private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("maxResults value must be <= 1000") if value > 1000
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_group_name, @status, @max_results, @next_token, @query_language)
  end
end
