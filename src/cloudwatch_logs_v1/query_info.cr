private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Information about one CloudWatch Logs Insights query that matches the request in a
  # `DescribeQueries` operation.
  class QueryInfo
    include JSON::Serializable

    # The query language used for this query. For more information about the query languages that
    # CloudWatch Logs supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The unique ID number of this query.
    @[JSON::Field(key: "queryId")]
    property query_id : String | Nil

    # The query string used in this query.
    @[JSON::Field(key: "queryString")]
    property query_string : String | Nil

    # The status of this query. Possible values are `Cancelled`, `Complete`, `Failed`, `Running`,
    # `Scheduled`, and `Unknown`.
    @[JSON::Field(key: "status", converter: ACWL::QueryStatus)]
    property status : QueryStatus | Nil

    # The date and time that this query was created.
    @[JSON::Field(key: "createTime")]
    property create_time : Int64 | Nil

    # The name of the log group scanned by this query.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The duration in milliseconds that the query took to execute.
    @[JSON::Field(key: "queryDuration")]
    property query_duration : Int64 | Nil

    # The total number of bytes scanned by the query. This indicates the cost associated with the
    # query.
    @[JSON::Field(key: "bytesScanned")]
    property bytes_scanned : Float64 | Nil

    # The ARN of the user who ran the query.
    @[JSON::Field(key: "userIdentity")]
    property user_identity : String | Nil

    def initialize(
      @query_language : QueryLanguage | Nil = nil,
      @query_id : String | Nil = nil,
      @query_string : String | Nil = nil,
      @status : QueryStatus | Nil = nil,
      @create_time : Int64 | Nil = nil,
      @log_group_name : String | Nil = nil,
      @query_duration : Int64 | Nil = nil,
      @bytes_scanned : Float64 | Nil = nil,
      @user_identity : String | Nil = nil,
    )
    end

    def_equals_and_hash(@query_language, @query_id, @query_string, @status, @create_time, @log_group_name, @query_duration, @bytes_scanned, @user_identity)
  end
end
