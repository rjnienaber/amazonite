module Amazonite::KinesisV1
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
  end
end
