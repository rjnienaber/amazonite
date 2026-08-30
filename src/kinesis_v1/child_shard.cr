private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Output parameter of the GetRecords API. The existing child shard of the current shard.
  class ChildShard
    include JSON::Serializable

    # The shard ID of the existing child shard of the current shard.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String

    # The current shard that is the parent of the existing child shard.
    @[JSON::Field(key: "ParentShards")]
    property parent_shards : Array(String) = [] of String

    @[JSON::Field(key: "HashKeyRange")]
    property hash_key_range : HashKeyRange

    def initialize(
      @shard_id : String,
      @parent_shards : Array(String),
      @hash_key_range : HashKeyRange,
    )
    end

    def validate! : Nil
      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @hash_key_range
        value.validate!
      end
    end

    def_equals_and_hash(@shard_id, @parent_shards, @hash_key_range)
  end
end
