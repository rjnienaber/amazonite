module Amazonite::EventBridgeV1
  class ListRuleNamesByTargetRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the target resource.
    @[JSON::Field(key: "TargetArn")]
    property target_arn : String

    # The name or ARN of the event bus to list rules for. If you omit this, the default event bus is
    # used.
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
      @target_arn : String,
      @event_bus_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
