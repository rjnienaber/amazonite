private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @log_stream_name
        raise Core::ValidationError.new("logStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @message
        raise Core::ValidationError.new("message length must be >= 1") if value.size < 1
      end

      if value = @timestamp
        raise Core::ValidationError.new("timestamp value must be >= 0") if value < 0
      end

      if value = @ingestion_time
        raise Core::ValidationError.new("ingestionTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@log_stream_name, @log_group_identifier, @message, @timestamp, @ingestion_time)
  end
end
