private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @shard_to_split
        raise Core::ValidationError.new("ShardToSplit length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardToSplit length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardToSplit does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @new_starting_hash_key
        raise Core::ValidationError.new("NewStartingHashKey does not match the required pattern") unless value.matches?(Regex.new("^(0|([1-9]\\d{0,38}))$"))
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_name, @shard_to_split, @new_starting_hash_key, @stream_arn, @stream_id)
  end
end
