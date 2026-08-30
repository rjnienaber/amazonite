private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeLogGroupsRequest
    include JSON::Serializable

    # When `includeLinkedAccounts` is set to `true`, use this parameter to specify the list of
    # accounts to search. You can specify as many as 20 account IDs in the array.
    @[JSON::Field(key: "accountIdentifiers")]
    property account_identifiers : Array(String) | Nil

    # The prefix to match.
    #
    # `logGroupNamePrefix` and `logGroupNamePattern` are mutually exclusive. Only one of these
    # parameters can be passed.
    @[JSON::Field(key: "logGroupNamePrefix")]
    property log_group_name_prefix : String | Nil

    # If you specify a string for this parameter, the operation returns only log groups that have
    # names that match the string based on a case-sensitive substring search. For example, if you
    # specify `DataLogs`, log groups named `DataLogs`, `aws/DataLogs`, and `GroupDataLogs` would
    # match, but `datalogs`, `Data/log/s` and `Groupdata` would not match.
    #
    # If you specify `logGroupNamePattern` in your request, then only `arn`, `creationTime`, and
    # `logGroupName` are included in the response.
    #
    # `logGroupNamePattern` and `logGroupNamePrefix` are mutually exclusive. Only one of these
    # parameters can be passed.
    @[JSON::Field(key: "logGroupNamePattern")]
    property log_group_name_pattern : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

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

    # Use this parameter to limit the results to only those log groups in the specified log group
    # class. If you omit this parameter, log groups of all classes can be returned.
    #
    # Specifies the log group class for this log group. There are three classes:
    #
    # - The `Standard` log class supports all CloudWatch Logs features.
    #
    # - The `Infrequent Access` log class supports a subset of CloudWatch Logs features and incurs
    # lower costs.
    #
    # - Use the `Delivery` log class only for delivering Lambda logs to store in Amazon S3 or Amazon
    # Data Firehose. Log events in log groups in the Delivery class are kept in CloudWatch Logs for
    # only one day. This log class doesn't offer rich CloudWatch Logs capabilities such as CloudWatch
    # Logs Insights queries.
    #
    # For details about the features supported by each class, see [Log
    # classes](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html)
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

    # Use this array to filter the list of log groups returned. If you specify this parameter, the
    # only other filter that you can choose to specify is `includeLinkedAccounts`.
    #
    # If you are using this operation in a monitoring account, you can specify the ARNs of log groups
    # in source accounts and in the monitoring account itself. If you are using this operation in an
    # account that is not a cross-account monitoring account, you can specify only log group names in
    # the same account as the operation.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    def initialize(
      @account_identifiers : Array(String) | Nil = nil,
      @log_group_name_prefix : String | Nil = nil,
      @log_group_name_pattern : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @include_linked_accounts : Bool | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
      @log_group_identifiers : Array(String) | Nil = nil,
    )
    end
  end
end
