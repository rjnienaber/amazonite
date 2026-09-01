private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DeleteRuleRequest
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Name")]
    property name : String

    # The name or ARN of the event bus associated with the rule. If you omit this, the default event
    # bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # If this is a managed rule, created by an Amazon Web Services service on your behalf, you must
    # specify `Force` as `True` to delete the rule. This parameter is ignored for rules that are not
    # managed rules. You can check whether a rule is a managed rule by using `DescribeRule` or
    # `ListRules` and checking the `ManagedBy` field of the response.
    @[JSON::Field(key: "Force")]
    property force : Bool | Nil

    def initialize(
      @name : String,
      @event_bus_name : String | Nil = nil,
      @force : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @event_bus_name
        raise Core::ValidationError.new("EventBusName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusName length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventBusName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[\\w-]*:events:[a-z]+-[a-z]+-[\\w-]+:[0-9]{12}:event-bus\\/)?[/\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@name, @event_bus_name, @force)
  end
end
