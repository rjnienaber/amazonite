private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class ListArchivesRequest
    include JSON::Serializable

    # A name prefix to filter the archives returned. Only archives with name that match the prefix are
    # returned.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The ARN of the event source associated with the archive.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # The state of the archive.
    @[JSON::Field(key: "State", converter: AEB::ArchiveState)]
    property state : ArchiveState | Nil

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
      @name_prefix : String | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @state : ArchiveState | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@name_prefix, @event_source_arn, @state, @next_token, @limit)
  end
end
