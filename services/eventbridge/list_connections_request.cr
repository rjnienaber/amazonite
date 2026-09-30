private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class ListConnectionsRequest
    include JSON::Serializable

    # A name prefix to filter results returned. Only connections with a name that starts with the
    # prefix are returned.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The state of the connection.
    @[JSON::Field(key: "ConnectionState", converter: AEB::ConnectionState)]
    property connection_state : ConnectionState | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of connections to return.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @name_prefix : String | Nil = nil,
      @connection_state : ConnectionState | Nil = nil,
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

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@name_prefix, @connection_state, @next_token, @limit)
  end
end
