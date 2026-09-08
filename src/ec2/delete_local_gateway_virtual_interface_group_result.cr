private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLocalGatewayVirtualInterfaceGroupResult
    # Information about the deleted local gateway virtual interface group.
    property local_gateway_virtual_interface_group : LocalGatewayVirtualInterfaceGroup | Nil

    def initialize(
      @local_gateway_virtual_interface_group : LocalGatewayVirtualInterfaceGroup | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_virtual_interface_group
        params.concat(value.to_query_params("#{prefix}LocalGatewayVirtualInterfaceGroup."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_virtual_interface_group: node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroup']").try { |n| LocalGatewayVirtualInterfaceGroup.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @local_gateway_virtual_interface_group
        value.validate!
      end
    end

    def_equals_and_hash(@local_gateway_virtual_interface_group)
  end
end
