module Amazonite::KinesisV1
  # Represents the input for `MergeShards`.
  class MergeShardsInput
    include JSON::Serializable

    # The name of the stream for the merge.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The shard ID of the shard to combine with the adjacent shard for the merge.
    @[JSON::Field(key: "ShardToMerge")]
    property shard_to_merge : String

    # The shard ID of the adjacent shard for the merge.
    @[JSON::Field(key: "AdjacentShardToMerge")]
    property adjacent_shard_to_merge : String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @shard_to_merge : String,
      @adjacent_shard_to_merge : String,
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
