private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Represents a log group.
  class LogGroup
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The creation time of the log group, expressed as the number of milliseconds after Jan 1, 1970
    # 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    @[JSON::Field(key: "retentionInDays")]
    property retention_in_days : Int32 | Nil

    # The number of metric filters.
    @[JSON::Field(key: "metricFilterCount")]
    property metric_filter_count : Int32 | Nil

    # The Amazon Resource Name (ARN) of the log group. This version of the ARN includes a trailing
    # `:*` after the log group name.
    #
    # Use this version to refer to the ARN in IAM policies when specifying permissions for most API
    # actions. The exception is when specifying permissions for
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html),
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html),
    # and
    # [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
    # The permissions for those three actions require the ARN version that doesn't include a trailing
    # `:*`.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # The number of bytes stored.
    @[JSON::Field(key: "storedBytes")]
    property stored_bytes : Int64 | Nil

    # The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # Displays whether this log group has a protection policy, or whether it had one in the past. For
    # more information, see
    # [PutDataProtectionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html).
    @[JSON::Field(key: "dataProtectionStatus", converter: ACWL::DataProtectionStatus)]
    property data_protection_status : DataProtectionStatus | Nil

    # Displays all the properties that this log group has inherited from account-level settings.
    @[JSON::Field(key: "inheritedProperties", converter: Core::ArrayConverter(ACWL::InheritedProperty))]
    property inherited_properties : Array(InheritedProperty) | Nil

    # This specifies the log group class for this log group. There are three classes:
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
    # For details about the features supported by the Standard and Infrequent Access classes, see [Log
    # classes](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html)
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

    # The Amazon Resource Name (ARN) of the log group. This version of the ARN doesn't include a
    # trailing `:*` after the log group name.
    #
    # Use this version to refer to the ARN in the following situations:
    #
    # - In the `logGroupIdentifier` input field in many CloudWatch Logs APIs.
    #
    # - In the `resourceArn` field in tagging APIs
    #
    # - In IAM policies, when specifying permissions for
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html),
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html),
    # and
    # [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
    @[JSON::Field(key: "logGroupArn")]
    property log_group_arn : String | Nil

    # Indicates whether deletion protection is enabled for this log group. When enabled, deletion
    # protection blocks all deletion operations until it is explicitly disabled.
    @[JSON::Field(key: "deletionProtectionEnabled")]
    property deletion_protection_enabled : Bool | Nil

    # Indicates whether bearer token authentication is enabled for this log group. When enabled,
    # bearer token authentication is allowed on operations until it is explicitly disabled.
    @[JSON::Field(key: "bearerTokenAuthenticationEnabled")]
    property bearer_token_authentication_enabled : Bool | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @retention_in_days : Int32 | Nil = nil,
      @metric_filter_count : Int32 | Nil = nil,
      @arn : String | Nil = nil,
      @stored_bytes : Int64 | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @data_protection_status : DataProtectionStatus | Nil = nil,
      @inherited_properties : Array(InheritedProperty) | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
      @log_group_arn : String | Nil = nil,
      @deletion_protection_enabled : Bool | Nil = nil,
      @bearer_token_authentication_enabled : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @creation_time, @retention_in_days, @metric_filter_count, @arn, @stored_bytes, @kms_key_id, @data_protection_status, @inherited_properties, @log_group_class, @log_group_arn, @deletion_protection_enabled, @bearer_token_authentication_enabled)
  end
end
