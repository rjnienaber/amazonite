module Amazonite::EventBridgeV1
  class ListRulesResponse
    include JSON::Serializable

    # The rules that match the specified criteria.
    @[JSON::Field(key: "Rules")]
    property rules : Array(Rule) | Nil

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
      @rules : Array(Rule) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@rules, @next_token)
  end
end
