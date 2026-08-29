private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class StartReplayRequest
    include JSON::Serializable

    # The name of the replay to start.
    @[JSON::Field(key: "ReplayName")]
    property replay_name : String

    # A description for the replay to start.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the archive to replay events from.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String

    # A time stamp for the time to start replaying events. Only events that occurred between the
    # `EventStartTime` and `EventEndTime` are replayed.
    @[JSON::Field(key: "EventStartTime", converter: Core::AWSEpochConverter)]
    property event_start_time : Time

    # A time stamp for the time to stop replaying events. Only events that occurred between the
    # `EventStartTime` and `EventEndTime` are replayed.
    @[JSON::Field(key: "EventEndTime", converter: Core::AWSEpochConverter)]
    property event_end_time : Time

    # A `ReplayDestination` object that includes details about the destination for the replay.
    @[JSON::Field(key: "Destination")]
    property destination : ReplayDestination

    def initialize(
      @replay_name : String,
      @event_source_arn : String,
      @event_start_time : Time,
      @event_end_time : Time,
      @destination : ReplayDestination,
      @description : String | Nil = nil,
    )
    end
  end
end
