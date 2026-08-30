private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class PutRuleRequest
    include JSON::Serializable

    # The name of the rule that you are creating or updating.
    @[JSON::Field(key: "Name")]
    property name : String

    # The scheduling expression. For example, "cron(0 20 * * ? *)" or "rate(5 minutes)".
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # The event pattern. For more information, see [Amazon EventBridge event
    # patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html) in
    # the * *Amazon EventBridge User Guide* *.
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

    # A description of the rule.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The Amazon Resource Name (ARN) of the IAM role associated with the rule.
    #
    # If you're setting an event bus in another account as the target and that account granted
    # permission to your account through an organization instead of directly by the account ID, you
    # must specify a `RoleArn` with proper permissions in the `Target` structure, instead of here in
    # this parameter.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The list of key-value pairs to associate with the rule.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The name or ARN of the event bus to associate with this rule. If you omit this, the default
    # event bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    def initialize(
      @name : String,
      @schedule_expression : String | Nil = nil,
      @event_pattern : String | Nil = nil,
      @state : RuleState | Nil = nil,
      @description : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @event_bus_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @event_pattern
        raise Core::ValidationError.new("EventPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventPattern length must be <= 4096") if value.size > 4096
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleArn length must be <= 1600") if value.size > 1600
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @event_bus_name
        raise Core::ValidationError.new("EventBusName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusName length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventBusName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[\\w-]*:events:[a-z]+-[a-z]+-[\\w-]+:[0-9]{12}:event-bus\\/)?[/\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@name, @schedule_expression, @event_pattern, @state, @description, @role_arn, @tags, @event_bus_name)
  end
end
