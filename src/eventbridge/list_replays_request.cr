private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class ListReplaysRequest
    include JSON::Serializable

    # A name prefix to filter the replays returned. Only replays with name that match the prefix are
    # returned.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The state of the replay.
    @[JSON::Field(key: "State", converter: AEB::ReplayState)]
    property state : ReplayState | Nil

    # The ARN of the archive from which the events are replayed.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of replays to retrieve.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @name_prefix : String | Nil = nil,
      @state : ReplayState | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name_prefix
        raise Core::ValidationError.new("NamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NamePrefix length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("NamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventSourceArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:.+\\/.+$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@name_prefix, @state, @event_source_arn, @next_token, @limit)
  end
end
