private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeQueryDefinitionsRequest
    include JSON::Serializable

    # The query language used for this query. For more information about the query languages that
    # CloudWatch Logs supports, see [Supported query
    # languages](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html).
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # Use this parameter to filter your results to only the query definitions that have names that
    # start with the prefix you specify.
    @[JSON::Field(key: "queryDefinitionNamePrefix")]
    property query_definition_name_prefix : String | Nil

    # Limits the number of returned query definitions to the specified number.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @query_language : QueryLanguage | Nil = nil,
      @query_definition_name_prefix : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@query_language, @query_definition_name_prefix, @max_results, @next_token)
  end
end
