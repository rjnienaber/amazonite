private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class ListTargetsByRuleRequest
    include JSON::Serializable

    # The name of the rule.
    @[JSON::Field(key: "Rule")]
    property rule : String

    # The name or ARN of the event bus associated with the rule. If you omit this, the default event
    # bus is used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results to return.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @rule : String,
      @event_bus_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
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

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@rule, @event_bus_name, @next_token, @limit)
  end
end
