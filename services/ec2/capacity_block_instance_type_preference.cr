private alias Core = Amazonite::Core

module Amazonite::EC2
  # Instance type preference for a Capacity Block search. Specifies one or more instance types to
  # evaluate when searching for available Capacity Blocks.
  class CapacityBlockInstanceTypePreference
    # The instance type to consider in the Capacity Block search.
    property instance_type : String | Nil

    def initialize(
      @instance_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type)
  end
end
