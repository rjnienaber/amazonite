module Amazonite::EventBridgeV1
  class ListPartnerEventSourcesRequest
    include JSON::Serializable

    # If you specify this, the results are limited to only those partner event sources that start with
    # the string you specify.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # pecifying this limits the number of results returned by this operation. The operation also
    # returns a NextToken which you can use in a subsequent operation to retrieve the next set of
    # results.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @name_prefix : String,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
