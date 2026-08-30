private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Details about an individual managed node.
  class Node
    include JSON::Serializable

    # The UTC timestamp for when the managed node data was last captured.
    @[JSON::Field(key: "CaptureTime", converter: Core::AWSEpochConverter)]
    property capture_time : Time | Nil

    # The ID of the managed node.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # Information about the ownership of the managed node.
    @[JSON::Field(key: "Owner")]
    property owner : NodeOwnerInfo | Nil

    # The Amazon Web Services Region that a managed node was created in or assigned to.
    @[JSON::Field(key: "Region")]
    property region : String | Nil

    # Information about the type of node.
    @[JSON::Field(key: "NodeType")]
    property node_type : NodeType | Nil

    def initialize(
      @capture_time : Time | Nil = nil,
      @id : String | Nil = nil,
      @owner : NodeOwnerInfo | Nil = nil,
      @region : String | Nil = nil,
      @node_type : NodeType | Nil = nil,
    )
    end

    def_equals_and_hash(@capture_time, @id, @owner, @region, @node_type)
  end
end
