module Amazonite::SsmV1
  class DescribeSessionsResponse
    include JSON::Serializable

    # A list of sessions meeting the request parameters.
    @[JSON::Field(key: "Sessions")]
    property sessions : Array(Session) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @sessions : Array(Session) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
