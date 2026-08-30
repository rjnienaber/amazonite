private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @resource_identifier
        raise Core::ValidationError.new("resourceIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("resourceIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("resourceIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@\\-\\*]*$"))
      end
    end

    def_equals_and_hash(@log_group_name, @resource_identifier)
  end
end
