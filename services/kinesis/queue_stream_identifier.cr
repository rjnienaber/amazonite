private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Identifies a data stream associated with a queue.
  class QueueStreamIdentifier
    include JSON::Serializable

    # The ARN of the data stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The time the data stream was created.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time

    def initialize(
      @stream_arn : String,
      @stream_creation_timestamp : Time,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end
    end

    def_equals_and_hash(@stream_arn, @stream_creation_timestamp)
  end
end
