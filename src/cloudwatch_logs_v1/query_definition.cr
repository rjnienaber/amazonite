private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @query_definition_id
        raise Core::ValidationError.new("queryDefinitionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryDefinitionId length must be <= 256") if value.size > 256
      end

      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 255") if value.size > 255
      end

      if value = @query_string
        raise Core::ValidationError.new("queryString length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryString length must be <= 10000") if value.size > 10000
      end

      if value = @last_modified
        raise Core::ValidationError.new("lastModified value must be >= 0") if value < 0
      end

      if value = @parameters
        raise Core::ValidationError.new("parameters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("parameters must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@query_language, @query_definition_id, @name, @query_string, @last_modified, @log_group_names, @parameters)
  end
end
