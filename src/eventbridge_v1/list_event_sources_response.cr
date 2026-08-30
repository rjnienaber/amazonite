module Amazonite::EventBridgeV1
  class ListEventSourcesResponse
    include JSON::Serializable

    # The list of event sources.
    @[JSON::Field(key: "EventSources")]
    property event_sources : Array(EventSource) | Nil

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
      @event_sources : Array(EventSource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@event_sources, @next_token)
  end
end
