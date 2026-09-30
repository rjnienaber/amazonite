private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSubnetResult
    # Information about the subnet.
    property subnet : Subnet | Nil

    def initialize(
      @subnet : Subnet | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet
        params.concat(value.to_query_params("#{prefix}Subnet."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet: node.xpath_node("*[local-name()='subnet']").try { |n| Subnet.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @subnet
        value.validate!
      end
    end

    def_equals_and_hash(@subnet)
  end
end
