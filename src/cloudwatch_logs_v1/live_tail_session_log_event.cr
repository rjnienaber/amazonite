module Amazonite::CloudWatchLogsV1
  # This object contains the information for one log event returned in a Live Tail stream.
  class LiveTailSessionLogEvent
    include JSON::Serializable

    # The name of the log stream that ingested this log event.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String | Nil

    # The name or ARN of the log group that ingested this log event.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The log event message text.
    @[JSON::Field(key: "message")]
    property message : String | Nil

    # The timestamp specifying when this log event was created.
    @[JSON::Field(key: "timestamp")]
    property timestamp : Int64 | Nil

    # The timestamp specifying when this log event was ingested into the log group.
    @[JSON::Field(key: "ingestionTime")]
    property ingestion_time : Int64 | Nil

    def initialize(
      @log_stream_name : String | Nil = nil,
      @log_group_identifier : String | Nil = nil,
      @message : String | Nil = nil,
      @timestamp : Int64 | Nil = nil,
      @ingestion_time : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@log_stream_name, @log_group_identifier, @message, @timestamp, @ingestion_time)
  end
end
