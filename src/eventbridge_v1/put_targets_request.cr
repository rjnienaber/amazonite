module Amazonite::EventBridgeV1
  class PutTargetsRequest
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Rule")]
    property rule : String

    # The name or ARN of the event bus associated with the rule. If you omit this, the default event
    # bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # The targets to update or add to the rule.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) = [] of Target

    def initialize(
      @rule : String,
      @targets : Array(Target),
      @event_bus_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@rule, @event_bus_name, @targets)
  end
end
