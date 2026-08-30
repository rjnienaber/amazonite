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
  end
end
