module Amazonite::KinesisV1
  # Represents the input for `SplitShard`.
  class SplitShardInput
    include JSON::Serializable

    # The name of the stream for the shard split.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The shard ID of the shard to split.
    @[JSON::Field(key: "ShardToSplit")]
    property shard_to_split : String

    # A hash key value for the starting hash key of one of the child shards created by the split. The
    # hash key range for a given shard constitutes a set of ordered contiguous positive integers. The
    # value for `NewStartingHashKey` must be in the range of hash keys being mapped into the shard.
    # The `NewStartingHashKey` hash key value and all higher hash key values in hash key range are
    # distributed to one of the child shards. All the lower hash key values in the range are
    # distributed to the other child shard.
    @[JSON::Field(key: "NewStartingHashKey")]
    property new_starting_hash_key : String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @shard_to_split : String,
      @new_starting_hash_key : String,
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
