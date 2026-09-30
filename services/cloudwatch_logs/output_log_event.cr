private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @timestamp
        raise Core::ValidationError.new("timestamp value must be >= 0") if value < 0
      end

      if value = @message
        raise Core::ValidationError.new("message length must be >= 1") if value.size < 1
      end

      if value = @ingestion_time
        raise Core::ValidationError.new("ingestionTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@timestamp, @message, @ingestion_time)
  end
end
