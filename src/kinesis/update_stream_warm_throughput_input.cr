private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateStreamWarmThroughputInput
    include JSON::Serializable

    # The ARN of the stream to be updated.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # The name of the stream to be updated.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The target warm throughput in MB/s that the stream should be scaled to handle. This represents
    # the throughput capacity that will be immediately available for write operations.
    @[JSON::Field(key: "WarmThroughputMiBps")]
    property warm_throughput_mi_bps : Int32

    def initialize(
      @warm_throughput_mi_bps : Int32,
      @stream_arn : String | Nil = nil,
      @stream_name : String | Nil = nil,
      @stream_id : String | Nil = nil,
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

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end

      if value = @warm_throughput_mi_bps
        raise Core::ValidationError.new("WarmThroughputMiBps value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@stream_arn, @stream_name, @stream_id, @warm_throughput_mi_bps)
  end
end
