module Amazonite::EventBridgeV1
  class ListTargetsByRuleResponse
    include JSON::Serializable

    # The targets assigned to the rule.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A token indicating there are more results available. If there are no more results, no token is
    # included in the response.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @targets : Array(Target) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
