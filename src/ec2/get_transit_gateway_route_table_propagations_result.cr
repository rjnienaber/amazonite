private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetTransitGatewayRouteTablePropagationsResult
    # Information about the route table propagations.
    property transit_gateway_route_table_propagations : Array(TransitGatewayRouteTablePropagation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_route_table_propagations : Array(TransitGatewayRouteTablePropagation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_route_table_propagations || [] of TransitGatewayRouteTablePropagation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayRouteTablePropagations.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_propagations: node.xpath_nodes("*[local-name()='transitGatewayRouteTablePropagations']/*[local-name()='item']").map { |n| TransitGatewayRouteTablePropagation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateway_route_table_propagations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_propagations, @next_token)
  end
end
