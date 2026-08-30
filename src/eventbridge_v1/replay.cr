private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # A `Replay` object that contains details about a replay.
  class Replay
    include JSON::Serializable

    # The name of the replay.
    @[JSON::Field(key: "ReplayName")]
    property replay_name : String | Nil

    # The ARN of the archive to replay event from.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # The current state of the replay.
    @[JSON::Field(key: "State", converter: AEB::ReplayState)]
    property state : ReplayState | Nil

    # A description of why the replay is in the current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # A time stamp for the time to start replaying events. This is determined by the time in the event
    # as described in
    # [Time](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html#eventbridge-Type-PutEventsRequestEntry-Time).
    @[JSON::Field(key: "EventStartTime", converter: Core::AWSEpochConverter)]
    property event_start_time : Time | Nil

    # A time stamp for the time to start replaying events. Any event with a creation time prior to the
    # `EventEndTime` specified is replayed.
    @[JSON::Field(key: "EventEndTime", converter: Core::AWSEpochConverter)]
    property event_end_time : Time | Nil

    # A time stamp for the time that the last event was replayed.
    @[JSON::Field(key: "EventLastReplayedTime", converter: Core::AWSEpochConverter)]
    property event_last_replayed_time : Time | Nil

    # A time stamp for the time that the replay started.
    @[JSON::Field(key: "ReplayStartTime", converter: Core::AWSEpochConverter)]
    property replay_start_time : Time | Nil

    # A time stamp for the time that the replay completed.
    @[JSON::Field(key: "ReplayEndTime", converter: Core::AWSEpochConverter)]
    property replay_end_time : Time | Nil

    def initialize(
      @replay_name : String | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @state : ReplayState | Nil = nil,
      @state_reason : String | Nil = nil,
      @event_start_time : Time | Nil = nil,
      @event_end_time : Time | Nil = nil,
      @event_last_replayed_time : Time | Nil = nil,
      @replay_start_time : Time | Nil = nil,
      @replay_end_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replay_name
        raise Core::ValidationError.new("ReplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ReplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventSourceArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@replay_name, @event_source_arn, @state, @state_reason, @event_start_time, @event_end_time, @event_last_replayed_time, @replay_start_time, @replay_end_time)
  end
end
