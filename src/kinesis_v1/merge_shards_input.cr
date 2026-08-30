private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @shard_to_merge
        raise Core::ValidationError.new("ShardToMerge length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardToMerge length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardToMerge does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @adjacent_shard_to_merge
        raise Core::ValidationError.new("AdjacentShardToMerge length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AdjacentShardToMerge length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AdjacentShardToMerge does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
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

    def_equals_and_hash(@stream_name, @shard_to_merge, @adjacent_shard_to_merge, @stream_arn, @stream_id)
  end
end
