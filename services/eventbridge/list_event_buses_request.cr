private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class ListEventBusesRequest
    include JSON::Serializable

    # Specifying this limits the results to only those event buses with names that start with the
    # specified prefix.
    @[JSON::Field(key: "NamePrefix")]
    property name_prefix : String | Nil

    # The token returned by a previous call, which you can use to retrieve the next set of results.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Specifying this limits the number of results returned by this operation. The operation also
    # returns a NextToken which you can use in a subsequent operation to retrieve the next set of
    # results.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name_prefix
        raise Core::ValidationError.new("NamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NamePrefix length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("NamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[/\\.\\-_A-Za-z0-9]+$"))
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

    def_equals_and_hash(@name_prefix, @next_token, @limit)
  end
end
