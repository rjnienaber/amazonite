private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This object includes the stream returned by your
  # [StartLiveTail](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTail.html)
  # request.
  class StartLiveTailResponseStream
    include JSON::Serializable

    # This object contains information about this Live Tail session, including the log groups included
    # and the log stream filters, if any.
    @[JSON::Field(key: "sessionStart")]
    property session_start : LiveTailSessionStart | Nil

    # This object contains the log events and session metadata.
    @[JSON::Field(key: "sessionUpdate")]
    property session_update : LiveTailSessionUpdate | Nil

    def initialize(
      @session_start : LiveTailSessionStart | Nil = nil,
      @session_update : LiveTailSessionUpdate | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @session_start
        value.validate!
      end

      if value = @session_update
        value.validate!
      end
    end

    def_equals_and_hash(@session_start, @session_update)
  end
end
