module Amazonite::KinesisV1
  class SubscribeToShardOutput
    include JSON::Serializable

    # The event stream that your consumer can use to read records from the shard.
    @[JSON::Field(key: "EventStream")]
    property event_stream : SubscribeToShardEventStream

    def initialize(
      @event_stream : SubscribeToShardEventStream,
    )
    end
  end
end
