private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Filters ListChannels results by source stream.
  class StreamFilter
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the source stream to filter by.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The creation timestamp of the source stream.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time | Nil

    def initialize(
      @stream_arn : String,
      @stream_creation_timestamp : Time | Nil = nil,
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
