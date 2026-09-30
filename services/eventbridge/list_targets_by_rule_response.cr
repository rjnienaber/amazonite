private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Targets must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@targets, @next_token)
  end
end
