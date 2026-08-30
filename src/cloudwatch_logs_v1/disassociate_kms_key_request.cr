module Amazonite::CloudWatchLogsV1
  class DisassociateKmsKeyRequest
    include JSON::Serializable

    # The name of the log group.
    #
    # In your `DisassociateKmsKey` operation, you must specify either the `resourceIdentifier`
    # parameter or the `logGroup` parameter, but you can't specify both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # Specifies the target for this operation. You must specify one of the following:
    #
    # - Specify the ARN of a log group to stop having CloudWatch Logs use the KMS key to encrypt log
    # events that are ingested and stored by that log group. After you run this operation, CloudWatch
    # Logs encrypts ingested log events with the default CloudWatch Logs method. The log group ARN
    # must be in the following format. Replace *REGION* and *ACCOUNT_ID* with your Region and account
    # ID.
    #
    # `arn:aws:logs:*REGION*:*ACCOUNT_ID*:log-group:*LOG_GROUP_NAME* `
    #
    # - Specify the following ARN to stop using this key to encrypt the results of future
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # operations in this account. Replace *REGION* and *ACCOUNT_ID* with your Region and account ID.
    #
    # `arn:aws:logs:*REGION*:*ACCOUNT_ID*:query-result:*`
    #
    # In your `DisssociateKmsKey` operation, you must specify either the `resourceIdentifier`
    # parameter or the `logGroup` parameter, but you can't specify both.
    @[JSON::Field(key: "resourceIdentifier")]
    property resource_identifier : String | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @resource_identifier : String | Nil = nil,
    )
    end
  end
end
