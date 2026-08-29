module Amazonite::SsmV1
  class NodeType
    include JSON::Serializable

    @[JSON::Field(key: "Instance")]
    property instance : InstanceInfo | Nil

    def initialize(
      @instance : InstanceInfo | Nil = nil,
    )
    end
  end
end
