module Amazonite::CloudWatchLogsV1
  # Represents a log stream, which is a sequence of log events from a single emitter of logs.
  class LogStream
    include JSON::Serializable

    # The name of the log stream.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String | Nil

    # The creation time of the stream, expressed as the number of milliseconds after `Jan 1, 1970
    # 00:00:00 UTC`.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The time of the first event, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`.
    @[JSON::Field(key: "firstEventTimestamp")]
    property first_event_timestamp : Int64 | Nil

    # The time of the most recent log event in the log stream in CloudWatch Logs. This number is
    # expressed as the number of milliseconds after `Jan 1, 1970 00:00:00 UTC`. The `lastEventTime`
    # value updates on an eventual consistency basis. It typically updates in less than an hour from
    # ingestion, but in rare situations might take longer.
    @[JSON::Field(key: "lastEventTimestamp")]
    property last_event_timestamp : Int64 | Nil

    # The ingestion time, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00 UTC` The
    # `lastIngestionTime` value updates on an eventual consistency basis. It typically updates in less
    # than an hour after ingestion, but in rare situations might take longer.
    @[JSON::Field(key: "lastIngestionTime")]
    property last_ingestion_time : Int64 | Nil

    # The sequence token.
    #
    # The sequence token is now ignored in `PutLogEvents` actions. `PutLogEvents` actions are always
    # accepted regardless of receiving an invalid sequence token. You don't need to obtain
    # `uploadSequenceToken` to use a `PutLogEvents` action.
    @[JSON::Field(key: "uploadSequenceToken")]
    property upload_sequence_token : String | Nil

    # The Amazon Resource Name (ARN) of the log stream.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # The number of bytes stored.
    #
    # **Important:** As of June 17, 2019, this parameter is no longer supported for log streams, and
    # is always reported as zero. This change applies only to log streams. The `storedBytes` parameter
    # for log groups is not affected.
    @[JSON::Field(key: "storedBytes")]
    property stored_bytes : Int64 | Nil

    def initialize(
      @log_stream_name : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @first_event_timestamp : Int64 | Nil = nil,
      @last_event_timestamp : Int64 | Nil = nil,
      @last_ingestion_time : Int64 | Nil = nil,
      @upload_sequence_token : String | Nil = nil,
      @arn : String | Nil = nil,
      @stored_bytes : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@log_stream_name, @creation_time, @first_event_timestamp, @last_event_timestamp, @last_ingestion_time, @upload_sequence_token, @arn, @stored_bytes)
  end
end
