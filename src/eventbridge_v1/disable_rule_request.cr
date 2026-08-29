module Amazonite::EventBridgeV1
  class DisableRuleRequest
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Name")]
    property name : String

    # The name or ARN of the event bus associated with the rule. If you omit this, the default event
    # bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    def initialize(
      @name : String,
      @event_bus_name : String | Nil = nil,
    )
    end
  end
end
