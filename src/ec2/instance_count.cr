private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance listing state.
  class InstanceCount
    # The number of listed Reserved Instances in the state specified by the `state`.
    property instance_count : Int32 | Nil

    # The states of the listed Reserved Instances.
    property state : ListingState | Nil

    def initialize(
      @instance_count : Int32 | Nil = nil,
      @state : ListingState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ListingState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @state)
  end
end
