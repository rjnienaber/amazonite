private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class SubscribeToShardInput
    include JSON::Serializable

    # For this parameter, use the value you obtained when you called RegisterStreamConsumer.
    @[JSON::Field(key: "ConsumerARN")]
    property consumer_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The ID of the shard you want to subscribe to. To see a list of all the shards for a given
    # stream, use ListShards.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String

    # The starting position in the data stream from which to start streaming.
    @[JSON::Field(key: "StartingPosition")]
    property starting_position : StartingPosition

    def initialize(
      @consumer_arn : String,
      @shard_id : String,
      @starting_position : StartingPosition,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @consumer_arn
        raise Core::ValidationError.new("ConsumerARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConsumerARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ConsumerARN does not match the required pattern") unless value.matches?(Regex.new("^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/[a-zA-Z0-9_.-]+\\/consumer\\/[a-zA-Z0-9_.-]+:[0-9]+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end

      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @starting_position
        value.validate!
      end
    end

    def_equals_and_hash(@consumer_arn, @stream_id, @shard_id, @starting_position)
  end
end
