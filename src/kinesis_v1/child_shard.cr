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
  end
end
