private alias Core = Amazonite::Core

module Amazonite::EC2
  # The list of instance types with the specified instance attributes.
  class InstanceTypeInfoFromInstanceRequirements
    # The matching instance type.
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
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type)
  end
end
