private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListAggregateLogGroupSummariesRequest
    include JSON::Serializable

    # When `includeLinkedAccounts` is set to `true`, use this parameter to specify the list of
    # accounts to search. You can specify as many as 20 account IDs in the array.
    @[JSON::Field(key: "accountIdentifiers")]
    property account_identifiers : Array(String) | Nil

    # If you are using a monitoring account, set this to `true` to have the operation return log
    # groups in the accounts listed in `accountIdentifiers`.
    #
    # If this parameter is set to `true` and `accountIdentifiers` contains a null value, the operation
    # returns all log groups in the monitoring account and all log groups in all source accounts that
    # are linked to the monitoring account.
    #
    # The default for this parameter is `false`.
    @[JSON::Field(key: "includeLinkedAccounts")]
    property include_linked_accounts : Bool | Nil

    # Filters the results by log group class to include only log groups of the specified class.
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

    # Use this parameter to limit the returned log groups to only those with names that match the
    # pattern that you specify. This parameter is a regular expression that can match prefixes and
    # substrings, and supports wildcard matching and matching multiple patterns, as in the following
    # examples.
    #
    # - Use `^` to match log group names by prefix.
    #
    # - For a substring match, specify the string to match. All matches are case sensitive
    #
    # - To match multiple patterns, separate them with a `|` as in the example
    # `^/aws/lambda|discovery`
    #
    # You can specify as many as five different regular expression patterns in this field, each of
    # which must be between 3 and 24 characters. You can include the `^` symbol as many as five times,
    # and include the `|` symbol as many as four times.
    @[JSON::Field(key: "logGroupNamePattern")]
    property log_group_name_pattern : String | Nil

    # Filters the results by data source characteristics to include only log groups associated with
    # the specified data sources.
    @[JSON::Field(key: "dataSources")]
    property data_sources : Array(DataSourceFilter) | Nil

    # Specifies how to group the log groups in the summary.
    @[JSON::Field(key: "groupBy", converter: ACWL::ListAggregateLogGroupSummariesGroupBy)]
    property group_by : ListAggregateLogGroupSummariesGroupBy

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of aggregated summaries to return. If you omit this parameter, the default is
    # up to 50 aggregated summaries.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @group_by : ListAggregateLogGroupSummariesGroupBy,
      @account_identifiers : Array(String) | Nil = nil,
      @include_linked_accounts : Bool | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
      @log_group_name_pattern : String | Nil = nil,
      @data_sources : Array(DataSourceFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_identifiers
        raise Core::ValidationError.new("accountIdentifiers must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("accountIdentifiers must have at most 20 item(s)") if value.size > 20
      end

      if value = @log_group_name_pattern
        raise Core::ValidationError.new("logGroupNamePattern length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("logGroupNamePattern length must be <= 129") if value.size > 129
        raise Core::ValidationError.new("logGroupNamePattern does not match the required pattern") unless value.matches?(Regex.new("^(\\^?[\\.\\-_\\/#A-Za-z0-9]{3,24})(\\|\\^?[\\.\\-_\\/#A-Za-z0-9]{3,24}){0,4}$"))
      end

      if value = @data_sources
        raise Core::ValidationError.new("dataSources must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("dataSources must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@account_identifiers, @include_linked_accounts, @log_group_class, @log_group_name_pattern, @data_sources, @group_by, @next_token, @limit)
  end
end
