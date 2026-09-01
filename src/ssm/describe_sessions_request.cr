private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeSessionsRequest
    include JSON::Serializable

    # The session status to retrieve a list of sessions for. For example, "Active".
    @[JSON::Field(key: "State", converter: AS::SessionState)]
    property state : SessionState

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # One or more filters to limit the type of sessions returned by the request.
    @[JSON::Field(key: "Filters")]
    property filters : Array(SessionFilter) | Nil

    def initialize(
      @state : SessionState,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(SessionFilter) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 200") if value > 200
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 6 item(s)") if value.size > 6
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@state, @max_results, @next_token, @filters)
  end
end
