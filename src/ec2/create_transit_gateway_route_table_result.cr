private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayRouteTableResult
    # Information about the transit gateway route table.
    property transit_gateway_route_table : TransitGatewayRouteTable | Nil

    def initialize(
      @transit_gateway_route_table : TransitGatewayRouteTable | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table
        params.concat(value.to_query_params("#{prefix}TransitGatewayRouteTable."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table: node.xpath_node("*[local-name()='transitGatewayRouteTable']").try { |n| TransitGatewayRouteTable.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_route_table
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_route_table)
  end
end
