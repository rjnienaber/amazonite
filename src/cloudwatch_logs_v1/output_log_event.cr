module Amazonite::CloudWatchLogsV1
  # Represents a log event.
  class OutputLogEvent
    include JSON::Serializable

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

    def initialize(
      @timestamp : Int64 | Nil = nil,
      @message : String | Nil = nil,
      @ingestion_time : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@timestamp, @message, @ingestion_time)
  end
end
