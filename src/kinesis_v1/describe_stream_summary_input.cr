module Amazonite::KinesisV1
  class DescribeStreamSummaryInput
    include JSON::Serializable

    # The name of the stream to describe.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
