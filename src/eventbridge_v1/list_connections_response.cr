module Amazonite::EventBridgeV1
  class ListConnectionsResponse
    include JSON::Serializable

    # An array of connections objects that include details about the connections.
    @[JSON::Field(key: "Connections")]
    property connections : Array(Connection) | Nil

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
      @connections : Array(Connection) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@connections, @next_token)
  end
end
