module Amazonite::EventBridgeV1
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
  end
end
