private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class UpdateStreamModeInput
    include JSON::Serializable

    # Specifies the ARN of the data stream whose capacity mode you want to update.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis
    # Data Streams, you can choose between an **on-demand** capacity mode and a **provisioned**
    # capacity mode for your data streams.
    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails

    # The target warm throughput in MB/s that the stream should be scaled to handle. This represents
    # the throughput capacity that will be immediately available for write operations. This field is
    # only valid when the stream mode is being updated to on-demand.
    @[JSON::Field(key: "WarmThroughputMiBps")]
    property warm_throughput_mi_bps : Int32 | Nil

    def initialize(
      @stream_arn : String,
      @stream_mode_details : StreamModeDetails,
      @stream_id : String | Nil = nil,
      @warm_throughput_mi_bps : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end

      if value = @stream_mode_details
        value.validate!
      end

      if value = @warm_throughput_mi_bps
        raise Core::ValidationError.new("WarmThroughputMiBps value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@stream_arn, @stream_id, @stream_mode_details, @warm_throughput_mi_bps)
  end
end
