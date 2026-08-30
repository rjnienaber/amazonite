private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This structure contains information about one log group in your account.
  class LogGroupSummary
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The Amazon Resource Name (ARN) of the log group.
    @[JSON::Field(key: "logGroupArn")]
    property log_group_arn : String | Nil

    # The log group class for this log group. For details about the features supported by each log
    # group class, see [Log
    # classes](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html)
    @[JSON::Field(key: "logGroupClass", converter: ACWL::LogGroupClass)]
    property log_group_class : LogGroupClass | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @log_group_arn : String | Nil = nil,
      @log_group_class : LogGroupClass | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @log_group_arn, @log_group_class)
  end
end
