private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # The data stream a queue delivers records from, and the position in that stream where delivery
  # begins.
  class QueueStreamConfiguration
    include JSON::Serializable

    # The ARN of the data stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The position in the stream from which the queue begins delivering records. The default is
    # `LATEST`.
    @[JSON::Field(key: "StartingPosition")]
    property starting_position : QueueStartingPosition | Nil

    def initialize(
      @stream_arn : String,
      @starting_position : QueueStartingPosition | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @starting_position
        value.validate!
      end
    end

    def_equals_and_hash(@stream_arn, @starting_position)
  end
end
