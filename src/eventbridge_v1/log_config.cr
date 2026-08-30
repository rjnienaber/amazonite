private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # The logging configuration settings for the event bus.
  #
  # For more information, see [Configuring logs for event
  # buses](https://docs.aws.amazon.com/eb-event-bus-logs.html) in the *EventBridge User Guide*.
  class LogConfig
    include JSON::Serializable

    # Whether EventBridge include detailed event information in the records it generates. Detailed
    # data can be useful for troubleshooting and debugging. This information includes details of the
    # event itself, as well as target details.
    #
    # For more information, see [Including detail data in event bus
    # logs](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-logs.html#eb-event-logs-data)
    # in the *EventBridge User Guide*.
    @[JSON::Field(key: "IncludeDetail", converter: AEB::IncludeDetail)]
    property include_detail : IncludeDetail | Nil

    # The level of logging detail to include. This applies to all log destinations for the event bus.
    #
    # For more information, see [Specifying event bus log
    # level](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-logs.html#eb-event-bus-logs-level)
    # in the *EventBridge User Guide*.
    @[JSON::Field(key: "Level", converter: AEB::Level)]
    property level : Level | Nil

    def initialize(
      @include_detail : IncludeDetail | Nil = nil,
      @level : Level | Nil = nil,
    )
    end

    def_equals_and_hash(@include_detail, @level)
  end
end
