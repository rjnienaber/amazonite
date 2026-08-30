private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ListNodesResult
    include JSON::Serializable

    # A list of managed nodes that match the specified filter criteria.
    @[JSON::Field(key: "Nodes")]
    property nodes : Array(Node) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @nodes : Array(Node) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @nodes
        raise Core::ValidationError.new("Nodes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Nodes must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@nodes, @next_token)
  end
end
