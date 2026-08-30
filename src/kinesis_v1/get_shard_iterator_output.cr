module Amazonite::KinesisV1
  # Represents the output for `GetShardIterator`.
  class GetShardIteratorOutput
    include JSON::Serializable

    # The position in the shard from which to start reading data records sequentially. A shard
    # iterator specifies this position using the sequence number of a data record in a shard.
    @[JSON::Field(key: "ShardIterator")]
    property shard_iterator : String | Nil

    def initialize(
      @shard_iterator : String | Nil = nil,
    )
    end
  end
end
