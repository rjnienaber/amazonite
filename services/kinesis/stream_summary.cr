private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The summary of a stream.
  class StreamSummary
    include JSON::Serializable

    # The name of a stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The status of the stream.
    @[JSON::Field(key: "StreamStatus", converter: AK::StreamStatus)]
    property stream_status : StreamStatus

    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails | Nil

    # The timestamp at which the stream was created.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time | Nil

    def initialize(
      @stream_name : String,
      @stream_arn : String,
      @stream_status : StreamStatus,
      @stream_mode_details : StreamModeDetails | Nil = nil,
      @stream_creation_timestamp : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_mode_details
        value.validate!
      end
    end

    def_equals_and_hash(@stream_name, @stream_arn, @stream_status, @stream_mode_details, @stream_creation_timestamp)
  end
end
