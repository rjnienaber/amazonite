module Amazonite::CloudWatchLogsV1
  # Represents a matched event.
  class FilteredLogEvent
    include JSON::Serializable

    # The name of the log stream to which this event belongs.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String | Nil

    # The time the event occurred, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`.
    @[JSON::Field(key: "timestamp")]
    property timestamp : Int64 | Nil

    # The data contained in the log event.
    @[JSON::Field(key: "message")]
    property message : String | Nil

    # The time the event was ingested, expressed as the number of milliseconds after `Jan 1, 1970
    # 00:00:00 UTC`.
    @[JSON::Field(key: "ingestionTime")]
    property ingestion_time : Int64 | Nil

    # The ID of the event.
    @[JSON::Field(key: "eventId")]
    property event_id : String | Nil

    def initialize(
      @log_stream_name : String | Nil = nil,
      @timestamp : Int64 | Nil = nil,
      @message : String | Nil = nil,
      @ingestion_time : Int64 | Nil = nil,
      @event_id : String | Nil = nil,
    )
    end
  end
end
