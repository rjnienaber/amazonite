private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult
    # Information about the association.
    property local_gateway_route_table_virtual_interface_group_association : LocalGatewayRouteTableVirtualInterfaceGroupAssociation | Nil

    def initialize(
      @local_gateway_route_table_virtual_interface_group_association : LocalGatewayRouteTableVirtualInterfaceGroupAssociation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_route_table_virtual_interface_group_association
        params.concat(value.to_query_params("#{prefix}LocalGatewayRouteTableVirtualInterfaceGroupAssociation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_virtual_interface_group_association: node.xpath_node("*[local-name()='localGatewayRouteTableVirtualInterfaceGroupAssociation']").try { |n| LocalGatewayRouteTableVirtualInterfaceGroupAssociation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_table_virtual_interface_group_association
        value.validate!
      end
    end

    def_equals_and_hash(@local_gateway_route_table_virtual_interface_group_association)
  end
end
