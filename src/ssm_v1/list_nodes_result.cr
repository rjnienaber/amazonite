module Amazonite::SsmV1
  class ListNodesResult
    include JSON::Serializable

    @[JSON::Field(key: "Nodes")]
    property nodes : Array(Node) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @nodes : Array(Node) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
