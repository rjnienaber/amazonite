private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @rule
        raise Core::ValidationError.new("Rule length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Rule length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Rule does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @event_bus_name
        raise Core::ValidationError.new("EventBusName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusName length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventBusName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[\\w-]*:events:[a-z]+-[a-z]+-[\\w-]+:[0-9]{12}:event-bus\\/)?[/\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Targets must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rule, @event_bus_name, @targets)
  end
end
