private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @replay_name
        raise Core::ValidationError.new("ReplayName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplayName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ReplayName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
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

    def_equals_and_hash(@replay_name, @description, @event_source_arn, @event_start_time, @event_end_time, @destination)
  end
end
