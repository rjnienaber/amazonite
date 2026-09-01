private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @replay_name
        raise Core::ValidationError.new("ReplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ReplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @replay_arn
        raise Core::ValidationError.new("ReplayArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ReplayArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventSourceArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @destination
        value.validate!
      end
    end

    def_equals_and_hash(@replay_name, @replay_arn, @description, @state, @state_reason, @event_source_arn, @destination, @event_start_time, @event_end_time, @event_last_replayed_time, @replay_start_time, @replay_end_time)
  end
end
