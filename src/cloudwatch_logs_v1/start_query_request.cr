private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class StartQueryRequest
    include JSON::Serializable

    # Specify the query language to use for this query. The options are Logs Insights QL, OpenSearch
    # PPL, and OpenSearch SQL. For more information about the query languages that CloudWatch Logs
    # supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The log group on which to perform the query.
    #
    # A `StartQuery` operation must include exactly one of the following parameters: `logGroupName`,
    # `logGroupNames`, or `logGroupIdentifiers`. The exception is queries using the OpenSearch Service
    # SQL query language, where you specify the log group names inside the `querystring` instead of
    # here.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The list of log groups to be queried. You can include up to 50 log groups.
    #
    # A `StartQuery` operation must include exactly one of the following parameters: `logGroupName`,
    # `logGroupNames`, or `logGroupIdentifiers`. The exception is queries using the OpenSearch Service
    # SQL query language, where you specify the log group names inside the `querystring` instead of
    # here.
    @[JSON::Field(key: "logGroupNames")]
    property log_group_names : Array(String) | Nil

    # The list of log groups to query. You can include up to 50 log groups.
    #
    # You can specify them by the log group name or ARN. If a log group that you're querying is in a
    # source account and you're using a monitoring account, you must specify the ARN of the log group
    # here. The query definition must also be defined in the monitoring account.
    #
    # If you specify an ARN, use the format
    # arn:aws:logs:*region*:*account-id*:log-group:*log_group_name* Don't include an * at the end.
    #
    # A `StartQuery` operation must include exactly one of the following parameters: `logGroupName`,
    # `logGroupNames`, or `logGroupIdentifiers`. The exception is queries using the OpenSearch Service
    # SQL query language, where you specify the log group names inside the `querystring` instead of
    # here.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # The beginning of the time range to query. The range is inclusive, so the specified start time is
    # included in the query. Specified as epoch time, the number of seconds since `January 1, 1970,
    # 00:00:00 UTC`.
    @[JSON::Field(key: "startTime")]
    property start_time : Int64

    # The end of the time range to query. The range is inclusive, so the specified end time is
    # included in the query. Specified as epoch time, the number of seconds since `January 1, 1970,
    # 00:00:00 UTC`.
    @[JSON::Field(key: "endTime")]
    property end_time : Int64

    # The query string to use. For more information, see [CloudWatch Logs Insights Query
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
    @[JSON::Field(key: "queryString")]
    property query_string : String

    # The maximum number of log events to return from the query. The maximum limit is 100,000. The
    # maximum events returned in a single GetQueryResults API call is 10,000 log events per request.
    # You can retrieve up to 100,000 log event results from a query by paginating with the
    # `nextToken`. 100,000 limit is only supported for Logs Insights QL and is currently not supported
    # for PPL and SQL query languages.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @start_time : Int64,
      @end_time : Int64,
      @query_string : String,
      @query_language : QueryLanguage | Nil = nil,
      @log_group_name : String | Nil = nil,
      @log_group_names : Array(String) | Nil = nil,
      @log_group_identifiers : Array(String) | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
