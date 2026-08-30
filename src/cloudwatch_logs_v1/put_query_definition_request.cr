private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutQueryDefinitionRequest
    include JSON::Serializable

    # Specify the query language to use for this query. The options are Logs Insights QL, OpenSearch
    # PPL, and OpenSearch SQL. For more information about the query languages that CloudWatch Logs
    # supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # A name for the query definition. If you are saving numerous query definitions, we recommend that
    # you name them. This way, you can find the ones you want by using the first part of the name as a
    # filter in the `queryDefinitionNamePrefix` parameter of
    # [DescribeQueryDefinitions](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html).
    @[JSON::Field(key: "name")]
    property name : String

    # If you are updating a query definition, use this parameter to specify the ID of the query
    # definition that you want to update. You can use
    # [DescribeQueryDefinitions](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html)
    # to retrieve the IDs of your saved query definitions.
    #
    # If you are creating a query definition, do not specify this parameter. CloudWatch generates a
    # unique ID for the new query definition and include it in the response to this operation.
    @[JSON::Field(key: "queryDefinitionId")]
    property query_definition_id : String | Nil

    # Use this parameter to include specific log groups as part of your query definition. If your
    # query uses the OpenSearch Service query language, you specify the log group names inside the
    # `querystring` instead of here.
    #
    # If you are updating an existing query definition for the Logs Insights QL or OpenSearch Service
    # PPL and you omit this parameter, then the updated definition will contain no log groups.
    @[JSON::Field(key: "logGroupNames")]
    property log_group_names : Array(String) | Nil

    # The query string to use for this definition. For more information, see [CloudWatch Logs Insights
    # Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
    @[JSON::Field(key: "queryString")]
    property query_string : String

    # Used as an idempotency token, to avoid returning an exception if the service receives the same
    # request twice because of a network error.
    @[JSON::Field(key: "clientToken")]
    property client_token : String | Nil

    # Use this parameter to include specific query parameters as part of your query definition. Query
    # parameters are supported only for Logs Insights QL queries. Query parameters allow you to use
    # placeholder variables in your query string that are substituted with values at execution time.
    # Use the `{{parameterName}}` syntax in your query string to reference a parameter.
    @[JSON::Field(key: "parameters")]
    property parameters : Array(QueryParameter) | Nil

    def initialize(
      @name : String,
      @query_string : String,
      @query_language : QueryLanguage | Nil = nil,
      @query_definition_id : String | Nil = nil,
      @log_group_names : Array(String) | Nil = nil,
      @client_token : String | Nil = nil,
      @parameters : Array(QueryParameter) | Nil = nil,
    )
    end
  end
end
