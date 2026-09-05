private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The updated Amazon CloudWatch Logs settings for a channel.
  class CloudWatchLogsUpdateInput
    include JSON::Serializable

    # Specifies whether logging to Amazon CloudWatch Logs is enabled.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool

    # The name of the Amazon CloudWatch Logs log group.
    @[JSON::Field(key: "LogGroupName")]
    property log_group_name : String | Nil

    # The name of the Amazon CloudWatch Logs log stream.
    @[JSON::Field(key: "LogStreamName")]
    property log_stream_name : String | Nil

    def initialize(
      @enabled : Bool,
      @log_group_name : String | Nil = nil,
      @log_stream_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("LogGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LogGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("LogGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @log_stream_name
        raise Core::ValidationError.new("LogStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LogStreamName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("LogStreamName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end
    end

    def_equals_and_hash(@enabled, @log_group_name, @log_stream_name)
  end
end
