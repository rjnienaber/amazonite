private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeReplayResponse
    include JSON::Serializable

    # The name of the replay.
    @[JSON::Field(key: "ReplayName")]
    property replay_name : String | Nil

    # The ARN of the replay.
    @[JSON::Field(key: "ReplayArn")]
    property replay_arn : String | Nil

    # The description of the replay.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The current state of the replay.
    @[JSON::Field(key: "State", converter: AEB::ReplayState)]
    property state : ReplayState | Nil

    # The reason that the replay is in the current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The ARN of the archive events were replayed from.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # A `ReplayDestination` object that contains details about the replay.
    @[JSON::Field(key: "Destination")]
    property destination : ReplayDestination | Nil

    # The time stamp of the first event that was last replayed from the archive.
    @[JSON::Field(key: "EventStartTime", converter: Core::AWSEpochConverter)]
    property event_start_time : Time | Nil

    # The time stamp for the last event that was replayed from the archive.
    @[JSON::Field(key: "EventEndTime", converter: Core::AWSEpochConverter)]
    property event_end_time : Time | Nil

    # The time that the event was last replayed.
    @[JSON::Field(key: "EventLastReplayedTime", converter: Core::AWSEpochConverter)]
    property event_last_replayed_time : Time | Nil

    # A time stamp for the time that the replay started.
    @[JSON::Field(key: "ReplayStartTime", converter: Core::AWSEpochConverter)]
    property replay_start_time : Time | Nil

    # A time stamp for the time that the replay stopped.
    @[JSON::Field(key: "ReplayEndTime", converter: Core::AWSEpochConverter)]
    property replay_end_time : Time | Nil

    def initialize(
      @replay_name : String | Nil = nil,
      @replay_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @state : ReplayState | Nil = nil,
      @state_reason : String | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @destination : ReplayDestination | Nil = nil,
      @event_start_time : Time | Nil = nil,
      @event_end_time : Time | Nil = nil,
      @event_last_replayed_time : Time | Nil = nil,
      @replay_start_time : Time | Nil = nil,
      @replay_end_time : Time | Nil = nil,
    )
    end
  end
end
