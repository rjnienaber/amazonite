private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The updated Amazon CloudWatch Logs configuration for a channel. Used in UpdateChannel.
  class ChannelLoggingUpdateInput
    include JSON::Serializable

    # The updated Amazon CloudWatch Logs settings for the channel.
    @[JSON::Field(key: "CloudWatchLogs")]
    property cloud_watch_logs : CloudWatchLogsUpdateInput

    def initialize(
      @cloud_watch_logs : CloudWatchLogsUpdateInput,
    )
    end

    def validate! : Nil
      if value = @cloud_watch_logs
        value.validate!
      end
    end

    def_equals_and_hash(@cloud_watch_logs)
  end
end
