private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class TestEventPatternRequest
    include JSON::Serializable

    # The event pattern. For more information, see [Events and Event
    # Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "EventPattern")]
    property event_pattern : String

    # The event, in JSON format, to test against the event pattern. The JSON must follow the format
    # specified in [Amazon Web Services
    # Events](https://docs.aws.amazon.com/eventbridge/latest/userguide/aws-events.html), and the
    # following fields are mandatory:
    #
    # - `id`
    #
    # - `account`
    #
    # - `source`
    #
    # - `time`
    #
    # - `region`
    #
    # - `resources`
    #
    # - `detail-type`
    @[JSON::Field(key: "Event")]
    property event : String

    def initialize(
      @event_pattern : String,
      @event : String,
    )
    end

    def validate! : Nil
      if value = @event_pattern
        raise Core::ValidationError.new("EventPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventPattern length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@event_pattern, @event)
  end
end
