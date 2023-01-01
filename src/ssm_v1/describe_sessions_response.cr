module Amazonite::SsmV1
  class DescribeSessionsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Sessions")]
    property sessions : Array(Session) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @sessions : Array(Session) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
