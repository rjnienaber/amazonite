private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class GetQueryResultsResponse
    include JSON::Serializable

    # The query language used for this query. For more information about the query languages that
    # CloudWatch Logs supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The log events that matched the query criteria during the most recent time it ran.
    #
    # The `results` value is an array of arrays. Each log event is one object in the top-level array.
    # Each of these log event objects is an array of `field`/`value` pairs.
    @[JSON::Field(key: "results")]
    property results : Array(Array(ResultField)) | Nil

    # Includes the number of log events scanned by the query, the number of log events that matched
    # the query criteria, and the total number of bytes in the scanned log events. These values
    # reflect the full raw results of the query.
    @[JSON::Field(key: "statistics")]
    property statistics : QueryStatistics | Nil

    # The status of the most recent running of the query. Possible values are `Cancelled`, `Complete`,
    # `Failed`, `Running`, `Scheduled`, `Timeout`, and `Unknown`.
    #
    # Queries time out after 60 minutes of runtime. To avoid having your queries time out, reduce the
    # time range being searched or partition your query into a number of queries.
    @[JSON::Field(key: "status", converter: ACWL::QueryStatus)]
    property status : QueryStatus | Nil

    # If you associated an KMS key with the CloudWatch Logs Insights query results in this account,
    # this field displays the ARN of the key that's used to encrypt the query results when
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # stores them.
    @[JSON::Field(key: "encryptionKey")]
    property encryption_key : String | Nil

    # If there are more log events remaining in the results, the response includes a `nextToken`. You
    # can use this token in a subsequent `GetQueryResults` request to get the next set of results. You
    # can retrieve up to 100,000 log event results from a query by paginating with this token. This is
    # only supported for Logs Insights QL and is currently not supported for PPL and SQL query
    # languages.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @query_language : QueryLanguage | Nil = nil,
      @results : Array(Array(ResultField)) | Nil = nil,
      @statistics : QueryStatistics | Nil = nil,
      @status : QueryStatus | Nil = nil,
      @encryption_key : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
