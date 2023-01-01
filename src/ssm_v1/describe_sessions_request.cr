private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribeSessionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "State", converter: AS::SessionState)]
    property state : SessionState

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(SessionFilter) | Nil

    def initialize(
      @state : SessionState,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(SessionFilter) | Nil = nil
    )
    end
  end
end
