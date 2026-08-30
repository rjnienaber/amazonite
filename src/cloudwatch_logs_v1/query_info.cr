private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end

      if value = @query_string
        raise Core::ValidationError.new("queryString length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("queryString length must be <= 10000") if value.size > 10000
      end

      if value = @create_time
        raise Core::ValidationError.new("createTime value must be >= 0") if value < 0
      end

      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @user_identity
        raise Core::ValidationError.new("userIdentity length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("userIdentity length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@query_language, @query_id, @query_string, @status, @create_time, @log_group_name, @query_duration, @bytes_scanned, @user_identity)
  end
end
