private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @log_stream_name
        raise Core::ValidationError.new("logStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

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

    def_equals_and_hash(@log_stream_name, @timestamp, @message, @ingestion_time, @event_id)
  end
end
