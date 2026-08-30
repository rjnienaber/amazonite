private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutAccountPolicyRequest
    include JSON::Serializable

    # A name for the policy. This must be unique within the account and cannot start with `aws/`.
    @[JSON::Field(key: "policyName")]
    property policy_name : String

    # Specify the policy, in JSON.
    #
    # **Data protection policy**
    #
    # A data protection policy must include two JSON blocks:
    #
    # - The first block must include both a `DataIdentifer` array and an `Operation` property with an
    # `Audit` action. The `DataIdentifer` array lists the types of sensitive data that you want to
    # mask. For more information about the available options, see [Types of data that you can
    # mask](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html).
    #
    # The `Operation` property with an `Audit` action is required to find the sensitive data terms.
    # This `Audit` action must contain a `FindingsDestination` object. You can optionally use that
    # `FindingsDestination` object to list one or more destinations to send audit findings to. If you
    # specify destinations such as log groups, Firehose streams, and S3 buckets, they must already
    # exist.
    #
    # - The second block must include both a `DataIdentifer` array and an `Operation` property with an
    # `Deidentify` action. The `DataIdentifer` array must exactly match the `DataIdentifer` array in
    # the first block of the policy.
    #
    # The `Operation` property with the `Deidentify` action is what actually masks the data, and it
    # must contain the ` "MaskConfig": {}` object. The ` "MaskConfig": {}` object must be empty.
    #
    # For an example data protection policy, see the **Examples** section on this page.
    #
    # The contents of the two `DataIdentifer` arrays must match exactly.
    #
    # In addition to the two JSON blocks, the `policyDocument` can also include `Name`, `Description`,
    # and `Version` fields. The `Name` is different than the operation's `policyName` parameter, and
    # is used as a dimension when CloudWatch Logs reports audit findings metrics to CloudWatch.
    #
    # The JSON specified in `policyDocument` can be up to 30,720 characters long.
    #
    # **Subscription filter policy**
    #
    # A subscription filter policy can include the following attributes in a JSON block:
    #
    # - **DestinationArn** The ARN of the destination to deliver log events to. Supported destinations
    # are:
    #
    # - An Kinesis Data Streams data stream in the same account as the subscription policy, for
    # same-account delivery.
    #
    # - An Firehose data stream in the same account as the subscription policy, for same-account
    # delivery.
    #
    # - A Lambda function in the same account as the subscription policy, for same-account delivery.
    #
    # - A logical destination in a different account created with
    # [PutDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html),
    # for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical
    # destinations.
    #
    # - **RoleArn** The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested
    # log events to the destination stream. You don't need to provide the ARN when you are working
    # with a logical destination for cross-account delivery.
    #
    # - **FilterPattern** A filter pattern for subscribing to a filtered stream of log events.
    #
    # - **Distribution** The method used to distribute log data to the destination. By default, log
    # data is grouped by log stream, but the grouping can be set to `Random` for a more even
    # distribution. This property is only applicable when the destination is an Kinesis Data Streams
    # data stream.
    #
    # **Transformer policy**
    #
    # A transformer policy must include one JSON block with the array of processors and their
    # configurations. For more information about available processors, see [ Processors that you can
    # use](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors).
    #
    # **Field index policy**
    #
    # A field index filter policy can include the following attribute in a JSON block:
    #
    # - **Fields** The array of field indexes to create.
    #
    # - **FieldsV2** The object of field indexes to create along with it's type.
    #
    # It must contain at least one field index.
    #
    # The following is an example of an index policy document that creates indexes with different
    # types.
    #
    # `"policyDocument": "{ \"Fields\": [ \"TransactionId\" ], \"FieldsV2\": {\"RequestId\":
    # {\"type\": \"FIELD_INDEX\"}, \"APIName\": {\"type\": \"FACET\"}, \"StatusCode\": {\"type\":
    # \"FACET\"}}}"`
    #
    # You can use `FieldsV2` to specify the type for each field. Supported types are `FIELD_INDEX` and
    # `FACET`. Field names within `Fields` and `FieldsV2` must be mutually exclusive.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String

    # The type of policy that you're creating or updating.
    @[JSON::Field(key: "policyType", converter: ACWL::PolicyType)]
    property policy_type : PolicyType

    # Currently the only valid value for this parameter is `ALL`, which specifies that the data
    # protection policy applies to all log groups in the account. If you omit this parameter, the
    # default of `ALL` is used.
    @[JSON::Field(key: "scope", converter: ACWL::Scope)]
    property scope : Scope | Nil

    # Use this parameter to apply the new policy to a subset of log groups in the account or a data
    # source name and type combination.
    #
    # Specifying `selectionCriteria` is valid only when you specify `SUBSCRIPTION_FILTER_POLICY`,
    # `FIELD_INDEX_POLICY` or `TRANSFORMER_POLICY`for `policyType`.
    #
    # - If `policyType` is `SUBSCRIPTION_FILTER_POLICY`, the only supported `selectionCriteria` filter
    # is `LogGroupName NOT IN []`
    #
    # - If `policyType` is `TRANSFORMER_POLICY`, the only supported `selectionCriteria` filter is
    # `LogGroupNamePrefix`
    #
    # - If `policyType` is `FIELD_INDEX_POLICY`, the supported `selectionCriteria` filters are:
    #
    # - `LogGroupNamePrefix`
    #
    # - `DataSourceName` AND `DataSourceType`
    #
    # When you specify `selectionCriteria` for a field index policy you can use either
    # `LogGroupNamePrefix` by itself or `DataSourceName` and `DataSourceType` together.
    #
    # The `selectionCriteria` string can be up to 25KB in length. The length is determined by using
    # its UTF-8 bytes.
    #
    # Using the `selectionCriteria` parameter with `SUBSCRIPTION_FILTER_POLICY` is useful to help
    # prevent infinite loops. For more information, see [Log recursion
    # prevention](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions-recursion-prevention.html).
    @[JSON::Field(key: "selectionCriteria")]
    property selection_criteria : String | Nil

    def initialize(
      @policy_name : String,
      @policy_document : String,
      @policy_type : PolicyType,
      @scope : Scope | Nil = nil,
      @selection_criteria : String | Nil = nil,
    )
    end
  end
end
