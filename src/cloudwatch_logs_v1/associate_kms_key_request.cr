module Amazonite::CloudWatchLogsV1
  class AssociateKmsKeyRequest
    include JSON::Serializable

    # The name of the log group.
    #
    # In your `AssociateKmsKey` operation, you must specify either the `resourceIdentifier` parameter
    # or the `logGroup` parameter, but you can't specify both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. This must be a
    # symmetric KMS key. For more information, see [Amazon Resource
    # Names](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms)
    # and [Using Symmetric and Asymmetric
    # Keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html).
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String

    # Specifies the target for this operation. You must specify one of the following:
    #
    # - Specify the following ARN to have future
    # [GetQueryResults](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html)
    # operations in this account encrypt the results with the specified KMS key. Replace *REGION* and
    # *ACCOUNT_ID* with your Region and account ID.
    #
    # `arn:aws:logs:*REGION*:*ACCOUNT_ID*:query-result:*`
    #
    # - Specify the ARN of a log group to have CloudWatch Logs use the KMS key to encrypt log events
    # that are ingested and stored by that log group. The log group ARN must be in the following
    # format. Replace *REGION* and *ACCOUNT_ID* with your Region and account ID.
    #
    # `arn:aws:logs:*REGION*:*ACCOUNT_ID*:log-group:*LOG_GROUP_NAME* `
    #
    # In your `AssociateKmsKey` operation, you must specify either the `resourceIdentifier` parameter
    # or the `logGroup` parameter, but you can't specify both.
    @[JSON::Field(key: "resourceIdentifier")]
    property resource_identifier : String | Nil

    def initialize(
      @kms_key_id : String,
      @log_group_name : String | Nil = nil,
      @resource_identifier : String | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @kms_key_id, @resource_identifier)
  end
end
