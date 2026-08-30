private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @parent_shard_id
        raise Core::ValidationError.new("ParentShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ParentShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ParentShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @adjacent_parent_shard_id
        raise Core::ValidationError.new("AdjacentParentShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AdjacentParentShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AdjacentParentShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @hash_key_range
        value.validate!
      end

      if value = @sequence_number_range
        value.validate!
      end
    end

    def_equals_and_hash(@shard_id, @parent_shard_id, @adjacent_parent_shard_id, @hash_key_range, @sequence_number_range)
  end
end
