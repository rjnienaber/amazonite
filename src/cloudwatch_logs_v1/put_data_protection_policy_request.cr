module Amazonite::CloudWatchLogsV1
  class PutDataProtectionPolicyRequest
    include JSON::Serializable

    # Specify either the log group name or log group ARN.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # Specify the data protection policy, in JSON.
    #
    # This policy must include two JSON blocks:
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
    # and `Version` fields. The `Name` is used as a dimension when CloudWatch Logs reports audit
    # findings metrics to CloudWatch.
    #
    # The JSON specified in `policyDocument` can be up to 30,720 characters.
    @[JSON::Field(key: "policyDocument")]
    property policy_document : String

    def initialize(
      @log_group_identifier : String,
      @policy_document : String,
    )
    end

    def_equals_and_hash(@log_group_identifier, @policy_document)
  end
end
