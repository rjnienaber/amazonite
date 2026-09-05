private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Identifies a source stream associated with a channel.
  class ChannelStreamIdentifier
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the source Kinesis data stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The time at which the source stream was created.
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
