private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class CreateLogGroupRequest
    include JSON::Serializable

    # A name for the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. For more
    # information, see [Amazon Resource
    # Names](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms).
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # The key-value pairs to use for the tags.
    #
    # You can grant users access to certain log groups while preventing them from accessing other log
    # groups. To do so, tag your groups and use IAM policies that refer to those tags. To assign tags
    # when you create a log group, you must have either the `logs:TagResource` or `logs:TagLogGroup`
    # permission. For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html). For more information
    # about using tags to control access, see [Controlling access to Amazon Web Services resources
    # using tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html).
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # Use this parameter to specify the log group class for this log group. There are three classes:
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
    # If you omit this parameter, the default of `STANDARD` is used.
    #
    # The value of `logGroupClass` can't be changed after a log group is created.
    #
    # For details about the features supported by each class, see [Log
    # classes](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html)
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

    # Use this parameter to enable deletion protection for the new log group. When enabled on a log
    # group, deletion protection blocks all deletion operations until it is explicitly disabled. By
    # default log groups are created without deletion protection enabled.
    @[JSON::Field(key: "deletionProtectionEnabled")]
    property deletion_protection_enabled : Bool | Nil

    def initialize(
      @log_group_name : String,
      @kms_key_id : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
      @deletion_protection_enabled : Bool | Nil = nil,
    )
    end
  end
end
