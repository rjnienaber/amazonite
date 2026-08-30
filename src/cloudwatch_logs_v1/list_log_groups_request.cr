private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class ListLogGroupsRequest
    include JSON::Serializable

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

    # Use this parameter to limit the results to only those log groups in the specified log group
    # class. If you omit this parameter, log groups of all classes can be returned.
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

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

    # When `includeLinkedAccounts` is set to `true`, use this parameter to specify the list of
    # accounts to search. You can specify as many as 20 account IDs in the array.
    @[JSON::Field(key: "accountIdentifiers")]
    property account_identifiers : Array(String) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of log groups to return. If you omit this parameter, the default is up to 50
    # log groups.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # An array of data source filters to filter log groups by their associated data sources. You can
    # filter by data source name, type, or both. Multiple filters within the same dimension are
    # combined with OR logic, while filters across different dimensions are combined with AND logic.
    @[JSON::Field(key: "dataSources")]
    property data_sources : Array(DataSourceFilter) | Nil

    # An array of field index names to filter log groups that have specific field indexes. Only log
    # groups containing all specified field indexes are returned. You can specify 1 to 20 field index
    # names, each with 1 to 512 characters.
    @[JSON::Field(key: "fieldIndexNames")]
    property field_index_names : Array(String) | Nil

    # An array of tag filters to return only log groups that have specific tags. Multiple filters are
    # combined with AND logic.
    @[JSON::Field(key: "logGroupTags")]
    property log_group_tags : Array(TagFilter) | Nil

    def initialize(
      @log_group_name_pattern : String | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
      @include_linked_accounts : Bool | Nil = nil,
      @account_identifiers : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @data_sources : Array(DataSourceFilter) | Nil = nil,
      @field_index_names : Array(String) | Nil = nil,
      @log_group_tags : Array(TagFilter) | Nil = nil,
    )
    end
  end
end
