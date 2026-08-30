module Amazonite::SsmV1
  # Information about a managed node's type.
  class NodeType
    include JSON::Serializable

    # Information about a specific managed node.
    @[JSON::Field(key: "Instance")]
    property instance : InstanceInfo | Nil

    def initialize(
      @instance : InstanceInfo | Nil = nil,
    )
    end

    def_equals_and_hash(@instance)
  end
end
