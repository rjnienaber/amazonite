module Amazonite::EventBridgeV1
  # The event buses the endpoint is associated with.
  class EndpointEventBus
    include JSON::Serializable

    # The ARN of the event bus the endpoint is associated with.
    @[JSON::Field(key: "EventBusArn")]
    property event_bus_arn : String

    def initialize(
      @event_bus_arn : String,
    )
    end
  end
end
