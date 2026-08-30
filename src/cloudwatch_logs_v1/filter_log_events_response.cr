module Amazonite::CloudWatchLogsV1
  class FilterLogEventsResponse
    include JSON::Serializable

    # The matched events.
    @[JSON::Field(key: "events")]
    property events : Array(FilteredLogEvent) | Nil

    # **Important** As of May 15, 2020, this parameter is no longer supported. This parameter returns
    # an empty list.
    #
    # Indicates which log streams have been searched and whether each has been searched completely.
    @[JSON::Field(key: "searchedLogStreams")]
    property searched_log_streams : Array(SearchedLogStream) | Nil

    # The token for the next set of items in the sorting direction specified by the `startFromHead`
    # parameter in the first request. The token expires after 24 hours.
    #
    # If the results don't include a `nextToken`, then pagination is finished.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @events : Array(FilteredLogEvent) | Nil = nil,
      @searched_log_streams : Array(SearchedLogStream) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@events, @searched_log_streams, @next_token)
  end
end
