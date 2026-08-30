module Amazonite::CloudWatchLogsV1
  class PutIndexPolicyRequest
    include JSON::Serializable

    # Specify either the log group name or log group ARN to apply this field index policy to. If you
    # specify an ARN, use the format arn:aws:logs:*region*:*account-id*:log-group:*log_group_name*
    # Don't include an * at the end.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # The index policy document, in JSON format. The following is an example of an index policy
    # document that creates indexes with different types.
    #
    # `"policyDocument": "{"Fields": [ "TransactionId" ], "FieldsV2": {"RequestId": {"type":
    # "FIELD_INDEX"}, "APIName": {"type": "FACET"}, "StatusCode": {"type": "FACET"}}}"`
    #
    # You can use `FieldsV2` to specify the type for each field. Supported types are `FIELD_INDEX` and
    # `FACET`. Field names within `Fields` and `FieldsV2` must be mutually exclusive.
    #
    # The policy document must include at least one field index. For more information about the fields
    # that can be included and other restrictions, see [Field index syntax and
    # quotas](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax.html).
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
