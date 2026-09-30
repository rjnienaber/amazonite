private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @shard_iterator
        raise Core::ValidationError.new("ShardIterator length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardIterator length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@shard_iterator)
  end
end
