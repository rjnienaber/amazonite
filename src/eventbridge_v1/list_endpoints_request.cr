module Amazonite::EventBridgeV1
  class ListEndpointsRequest
    include JSON::Serializable

    # A value that will return a subset of the endpoints associated with this account. For example,
    # `"NamePrefix": "ABC"` will return all endpoints with "ABC" in the name.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The primary Region of the endpoints associated with this account. For example `"HomeRegion":
    # "us-east-1"`.
    @[JSON::Field(key: "HomeRegion")]
    property home_region : String | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results returned by the call.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @name_prefix : String | Nil = nil,
      @home_region : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
