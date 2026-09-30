private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @owner
        value.validate!
      end

      if value = @region
        raise Core::ValidationError.new("Region length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Region length must be <= 64") if value.size > 64
      end

      if value = @node_type
        value.validate!
      end
    end

    def_equals_and_hash(@capture_time, @id, @owner, @region, @node_type)
  end
end
