module Amazonite::KinesisV1
  # A uniquely identified group of data records in a Kinesis data stream.
  class Shard
    include JSON::Serializable

    # The unique identifier of the shard within the stream.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String

    # The shard ID of the shard's parent.
    @[JSON::Field(key: "ParentShardId")]
    property parent_shard_id : String | Nil

    # The shard ID of the shard adjacent to the shard's parent.
    @[JSON::Field(key: "AdjacentParentShardId")]
    property adjacent_parent_shard_id : String | Nil

    # The range of possible hash key values for the shard, which is a set of ordered contiguous
    # positive integers.
    @[JSON::Field(key: "HashKeyRange")]
    property hash_key_range : HashKeyRange

    # The range of possible sequence numbers for the shard.
    @[JSON::Field(key: "SequenceNumberRange")]
    property sequence_number_range : SequenceNumberRange

    def initialize(
      @shard_id : String,
      @hash_key_range : HashKeyRange,
      @sequence_number_range : SequenceNumberRange,
      @parent_shard_id : String | Nil = nil,
      @adjacent_parent_shard_id : String | Nil = nil,
    )
    end
  end
end
