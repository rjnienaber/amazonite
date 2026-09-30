private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLocalGatewayVirtualInterfaceResult
    # Information about the local gateway virtual interface.
    property local_gateway_virtual_interface : LocalGatewayVirtualInterface | Nil

    def initialize(
      @local_gateway_virtual_interface : LocalGatewayVirtualInterface | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_virtual_interface
        params.concat(value.to_query_params("#{prefix}LocalGatewayVirtualInterface."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_virtual_interface: node.xpath_node("*[local-name()='localGatewayVirtualInterface']").try { |n| LocalGatewayVirtualInterface.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @local_gateway_virtual_interface
        value.validate!
      end
    end

    def_equals_and_hash(@local_gateway_virtual_interface)
  end
end
