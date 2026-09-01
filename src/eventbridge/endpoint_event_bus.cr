private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @event_bus_arn
        raise Core::ValidationError.new("EventBusArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusArn length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("EventBusArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z-]*:events:[a-z]+-[a-z-]+-\\d+:\\d{12}:event-bus/[\\w.-]+$"))
      end
    end

    def_equals_and_hash(@event_bus_arn)
  end
end
