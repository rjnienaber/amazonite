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

    def_equals_and_hash(@event_pattern, @event)
  end
end
