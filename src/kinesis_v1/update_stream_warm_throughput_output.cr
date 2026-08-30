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
  end
end
