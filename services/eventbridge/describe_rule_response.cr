private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DescribeRuleResponse
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) of the rule.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The event pattern. For more information, see [Events and Event
    # Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "EventPattern")]
    property event_pattern : String | Nil

    # The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)".
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # Specifies whether the rule is enabled or disabled.
    @[JSON::Field(key: "State", converter: AEB::RuleState)]
    property state : RuleState | Nil

    # The description of the rule.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The Amazon Resource Name (ARN) of the IAM role associated with the rule.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # If this is a managed rule, created by an Amazon Web Services service on your behalf, this field
    # displays the principal name of the Amazon Web Services service that created the rule.
    @[JSON::Field(key: "ManagedBy")]
    property managed_by : String | Nil

    # The name of the event bus associated with the rule.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # The account ID of the user that created the rule. If you use `PutRule` to put a rule on an event
    # bus in another account, the other account is the owner of the rule, and the rule ARN includes
    # the account ID for that account. However, the value for `CreatedBy` is the account ID as the
    # account that created the rule in the other account.
    @[JSON::Field(key: "CreatedBy")]
    property created_by : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @event_pattern : String | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @state : RuleState | Nil = nil,
      @description : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @managed_by : String | Nil = nil,
      @event_bus_name : String | Nil = nil,
      @created_by : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1600") if value.size > 1600
      end

      if value = @event_pattern
        raise Core::ValidationError.new("EventPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventPattern length must be <= 4096") if value.size > 4096
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleArn length must be <= 1600") if value.size > 1600
      end

      if value = @managed_by
        raise Core::ValidationError.new("ManagedBy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ManagedBy length must be <= 128") if value.size > 128
      end

      if value = @event_bus_name
        raise Core::ValidationError.new("EventBusName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("EventBusName does not match the required pattern") unless value.matches?(Regex.new("^[/\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @created_by
        raise Core::ValidationError.new("CreatedBy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CreatedBy length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@name, @arn, @event_pattern, @schedule_expression, @state, @description, @role_arn, @managed_by, @event_bus_name, @created_by)
  end
end
