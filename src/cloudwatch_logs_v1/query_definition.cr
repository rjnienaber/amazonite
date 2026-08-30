private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This structure contains details about a saved CloudWatch Logs Insights query definition.
  class QueryDefinition
    include JSON::Serializable

    # The query language used for this query. For more information about the query languages that
    # CloudWatch Logs supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The unique ID of the query definition.
    @[JSON::Field(key: "queryDefinitionId")]
    property query_definition_id : String | Nil

    # The name of the query definition.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The query string to use for this definition. For more information, see [CloudWatch Logs Insights
    # Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
    @[JSON::Field(key: "queryString")]
    property query_string : String | Nil

    # The date that the query definition was most recently modified.
    @[JSON::Field(key: "lastModified")]
    property last_modified : Int64 | Nil

    # If this query definition contains a list of log groups that it is limited to, that list appears
    # here.
    @[JSON::Field(key: "logGroupNames")]
    property log_group_names : Array(String) | Nil

    # If this query definition contains a list of query parameters that define placeholder variables
    # for the query string, that list appears here.
    @[JSON::Field(key: "parameters")]
    property parameters : Array(QueryParameter) | Nil

    def initialize(
      @query_language : QueryLanguage | Nil = nil,
      @query_definition_id : String | Nil = nil,
      @name : String | Nil = nil,
      @query_string : String | Nil = nil,
      @last_modified : Int64 | Nil = nil,
      @log_group_names : Array(String) | Nil = nil,
      @parameters : Array(QueryParameter) | Nil = nil,
    )
    end
  end
end
