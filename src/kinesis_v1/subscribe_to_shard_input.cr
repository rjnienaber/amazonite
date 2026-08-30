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
  end
end
