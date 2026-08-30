private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @event_stream
        value.validate!
      end
    end

    def_equals_and_hash(@event_stream)
  end
end
