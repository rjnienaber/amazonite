private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # Contains information about a rule in Amazon EventBridge.
  class Rule
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) of the rule.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The event pattern of the rule. For more information, see [Events and Event
    # Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "EventPattern")]
    property event_pattern : String | Nil

    # The state of the rule.
    #
    # Valid values include:
    #
    # - `DISABLED`: The rule is disabled. EventBridge does not match any events against the rule.
    #
    # - `ENABLED`: The rule is enabled. EventBridge matches events against the rule, *except* for
    # Amazon Web Services management events delivered through CloudTrail.
    #
    # - `ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS`: The rule is enabled for all events, including
    # Amazon Web Services management events delivered through CloudTrail.
    #
    # Management events provide visibility into management operations that are performed on resources
    # in your Amazon Web Services account. These are also known as control plane operations. For more
    # information, see [Logging management
    # events](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events)
    # in the *CloudTrail User Guide*, and [Filtering management events from Amazon Web Services
    # services](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail)
    # in the * *Amazon EventBridge User Guide* *.
    #
    # This value is only valid for rules on the
    # [default](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses)
    # event bus or [custom event
    # buses](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html). It
    # does not apply to [partner event
    # buses](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html).
    @[JSON::Field(key: "State", converter: AEB::RuleState)]
    property state : RuleState | Nil

    # The description of the rule.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)". For more
    # information, see [Creating an Amazon EventBridge rule that runs on a
    # schedule](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule-schedule.html).
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # The Amazon Resource Name (ARN) of the role that is used for target invocation.
    #
    # If you're setting an event bus in another account as the target and that account granted
    # permission to your account through an organization instead of directly by the account ID, you
    # must specify a `RoleArn` with proper permissions in the `Target` structure, instead of here in
    # this parameter.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # If the rule was created on behalf of your account by an Amazon Web Services service, this field
    # displays the principal name of the service that created the rule.
    @[JSON::Field(key: "ManagedBy")]
    property managed_by : String | Nil

    # The name or ARN of the event bus associated with the rule. If you omit this, the default event
    # bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @event_pattern : String | Nil = nil,
      @state : RuleState | Nil = nil,
      @description : String | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @managed_by : String | Nil = nil,
      @event_bus_name : String | Nil = nil,
    )
    end
  end
end
