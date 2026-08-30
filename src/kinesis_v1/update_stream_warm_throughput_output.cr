private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class UpdateStreamWarmThroughputOutput
    include JSON::Serializable

    # The ARN of the stream that was updated.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # The name of the stream that was updated.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # Specifies the updated warm throughput configuration for your data stream.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughputObject | Nil

    def initialize(
      @stream_arn : String | Nil = nil,
      @stream_name : String | Nil = nil,
      @warm_throughput : WarmThroughputObject | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @warm_throughput
        value.validate!
      end
    end

    def_equals_and_hash(@stream_arn, @stream_name, @warm_throughput)
  end
end
