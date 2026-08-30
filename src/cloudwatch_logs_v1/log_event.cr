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
  end
end
