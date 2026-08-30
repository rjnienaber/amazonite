private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class PutSubscriptionFilterRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # A name for the subscription filter. If you are updating an existing filter, you must specify the
    # correct name in `filterName`. To find the name of the filter currently associated with a log
    # group, use
    # [DescribeSubscriptionFilters](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html).
    @[JSON::Field(key: "filterName")]
    property filter_name : String

    # A filter pattern for subscribing to a filtered stream of log events.
    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String

    # The ARN of the destination to deliver matching log events to. Currently, the supported
    # destinations are:
    #
    # - An Amazon Kinesis stream belonging to the same account as the subscription filter, for
    # same-account delivery.
    #
    # - A logical destination (specified using an ARN) belonging to a different account, for
    # cross-account delivery.
    #
    # If you're setting up a cross-account subscription, the destination must have an IAM policy
    # associated with it. The IAM policy must allow the sender to send logs to the destination. For
    # more information, see
    # [PutDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html).
    #
    # - A Kinesis Data Firehose delivery stream belonging to the same account as the subscription
    # filter, for same-account delivery.
    #
    # - A Lambda function belonging to the same account as the subscription filter, for same-account
    # delivery.
    @[JSON::Field(key: "destinationArn")]
    property destination_arn : String

    # The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to
    # the destination stream. You don't need to provide the ARN when you are working with a logical
    # destination for cross-account delivery.
    @[JSON::Field(key: "roleArn")]
    property role_arn : String | Nil

    # The method used to distribute log data to the destination. By default, log data is grouped by
    # log stream, but the grouping can be set to random for a more even distribution. This property is
    # only applicable when the destination is an Amazon Kinesis data stream.
    @[JSON::Field(key: "distribution", converter: ACWL::Distribution)]
    property distribution : Distribution | Nil

    # This parameter is valid only for log groups that have an active log transformer. For more
    # information about log transformers, see
    # [PutTransformer](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html).
    #
    # If the log group uses either a log-group level or account-level transformer, and you specify
    # `true`, the subscription filter will be applied on the transformed version of the log events
    # instead of the original ingested log events.
    @[JSON::Field(key: "applyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    # A filter expression that specifies which log events should be processed by this subscription
    # filter based on system fields such as source account and source region. Uses selection criteria
    # syntax with operators like `=`, `!=`, `AND`, `OR`, `IN`, `NOT IN`. Example: `@aws.region NOT IN
    # ["cn-north-1"]` or `@aws.account = "123456789012" AND @aws.region = "us-east-1"`. Maximum
    # length: 2000 characters.
    @[JSON::Field(key: "fieldSelectionCriteria")]
    property field_selection_criteria : String | Nil

    # A list of system fields to include in the log events sent to the subscription destination. Valid
    # values are `@aws.account`, `@aws.region`, and `@source.log`. These fields provide source
    # information for centralized log data in the forwarded payload.
    @[JSON::Field(key: "emitSystemFields")]
    property emit_system_fields : Array(String) | Nil

    def initialize(
      @log_group_name : String,
      @filter_name : String,
      @filter_pattern : String,
      @destination_arn : String,
      @role_arn : String | Nil = nil,
      @distribution : Distribution | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
      @field_selection_criteria : String | Nil = nil,
      @emit_system_fields : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @filter_name
        raise Core::ValidationError.new("filterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("filterName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @destination_arn
        raise Core::ValidationError.new("destinationArn length must be >= 1") if value.size < 1
      end

      if value = @role_arn
        raise Core::ValidationError.new("roleArn length must be >= 1") if value.size < 1
      end

      if value = @field_selection_criteria
        raise Core::ValidationError.new("fieldSelectionCriteria length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("fieldSelectionCriteria length must be <= 2000") if value.size > 2000
      end
    end

    def_equals_and_hash(@log_group_name, @filter_name, @filter_pattern, @destination_arn, @role_arn, @distribution, @apply_on_transformed_logs, @field_selection_criteria, @emit_system_fields)
  end
end
