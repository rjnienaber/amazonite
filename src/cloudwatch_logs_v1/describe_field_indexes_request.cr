private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeFieldIndexesRequest
    include JSON::Serializable

    # An array containing the names or ARNs of the log groups that you want to retrieve field indexes
    # for.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) = [] of String

    # The index categories to return. The following values are supported:
    #
    # - `DEFAULT`: Fields that CloudWatch Logs indexes by default. Examples include `@logStream` and
    # `@data_format`.
    #
    # - `CUSTOM`: Fields that you added manually to the field index policy. CloudWatch Logs always
    # indexes these fields. These fields count toward the quota of 20 fields for each log group.
    #
    # - `AUTO`: Fields that CloudWatch Logs indexes automatically based on your query patterns and
    # usage. These fields do not count toward the field index quota. CloudWatch Logs might update
    # these fields based on changes in your query patterns. To keep a field indexed permanently, add
    # it to an account-level or log-group level field index policy.
    #
    # - `INACTIVE`: Fields that CloudWatch Logs indexed before but does not index now. This happens if
    # you remove a field from the field index policy or if CloudWatch Logs automatically selects a
    # different field based on your queries.
    #
    # If you omit this parameter, the response includes the `DEFAULT`, `CUSTOM`, and `INACTIVE`
    # categories.
    #
    # For more information about automatically indexed fields and using the `AUTO` category, see
    # [Automatically indexed
    # fields](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Automatic.html).
    @[JSON::Field(key: "indexCategories", converter: Core::ArrayConverter(ACWL::IndexCategory))]
    property index_categories : Array(IndexCategory) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @log_group_identifiers : Array(String),
      @index_categories : Array(IndexCategory) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_identifiers
        raise Core::ValidationError.new("logGroupIdentifiers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifiers must have at most 100 item(s)") if value.size > 100
      end

      if value = @index_categories
        raise Core::ValidationError.new("indexCategories must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("indexCategories must have at most 4 item(s)") if value.size > 4
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_group_identifiers, @index_categories, @next_token)
  end
end
