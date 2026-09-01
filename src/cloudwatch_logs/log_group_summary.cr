private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@log_group_name, @log_group_arn, @log_group_class)
  end
end
