private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @instance
        value.validate!
      end
    end

    def_equals_and_hash(@instance)
  end
end
