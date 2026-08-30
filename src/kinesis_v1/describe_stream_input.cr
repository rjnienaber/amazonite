module Amazonite::KinesisV1
  # Represents the input for `DescribeStream`.
  class DescribeStreamInput
    include JSON::Serializable

    # The name of the stream to describe.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The maximum number of shards to return in a single call. The default value is 100. If you
    # specify a value greater than 100, at most 100 results are returned.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The shard ID of the shard to start with.
    #
    # Specify this parameter to indicate that you want to describe the stream starting with the shard
    # whose ID immediately follows `ExclusiveStartShardId`.
    #
    # If you don't specify this parameter, the default behavior for `DescribeStream` is to describe
    # the stream starting with the first shard in the stream.
    @[JSON::Field(key: "ExclusiveStartShardId")]
    property exclusive_start_shard_id : String | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @exclusive_start_shard_id : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
