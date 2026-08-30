module Amazonite::KinesisV1
  # This is a tagged union for all of the types of events an enhanced fan-out consumer can receive
  # over HTTP/2 after a call to SubscribeToShard.
  class SubscribeToShardEventStream
    include JSON::Serializable

    # After you call SubscribeToShard, Kinesis Data Streams sends events of this type to your
    # consumer. For an example of how to handle these events, see [Enhanced Fan-Out Using the Kinesis
    # Data Streams API](/streams/latest/dev/building-enhanced-consumers-api.html).
    @[JSON::Field(key: "SubscribeToShardEvent")]
    property subscribe_to_shard_event : SubscribeToShardEvent | Nil

    def initialize(
      @subscribe_to_shard_event : SubscribeToShardEvent | Nil = nil,
    )
    end
  end
end
