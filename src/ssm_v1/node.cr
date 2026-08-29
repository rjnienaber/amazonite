private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Node
    include JSON::Serializable

    @[JSON::Field(key: "CaptureTime", converter: Core::AWSEpochConverter)]
    property capture_time : Time | Nil

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Owner")]
    property owner : NodeOwnerInfo | Nil

    @[JSON::Field(key: "Region")]
    property region : String | Nil

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
  end
end
