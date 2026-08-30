private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains the information for one sample log event that is associated with an
  # anomaly found by a log anomaly detector.
  class LogEvent
    include JSON::Serializable

    # The time stamp of the log event.
    @[JSON::Field(key: "timestamp")]
    property timestamp : Int64 | Nil

    # The message content of the log event.
    @[JSON::Field(key: "message")]
    property message : String | Nil

    def initialize(
      @timestamp : Int64 | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @timestamp
        raise Core::ValidationError.new("timestamp value must be >= 0") if value < 0
      end

      if value = @message
        raise Core::ValidationError.new("message length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@timestamp, @message)
  end
end
