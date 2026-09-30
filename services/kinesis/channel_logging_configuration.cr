private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The Amazon CloudWatch Logs configuration for a channel.
  class ChannelLoggingConfiguration
    include JSON::Serializable

    # The Amazon CloudWatch Logs settings for the channel.
    @[JSON::Field(key: "CloudWatchLogs")]
    property cloud_watch_logs : CloudWatchLogs

    def initialize(
      @cloud_watch_logs : CloudWatchLogs,
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
