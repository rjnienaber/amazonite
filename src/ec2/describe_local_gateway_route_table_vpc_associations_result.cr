private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLocalGatewayRouteTableVpcAssociationsResult
    # Information about the associations.
    property local_gateway_route_table_vpc_associations : Array(LocalGatewayRouteTableVpcAssociation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @local_gateway_route_table_vpc_associations : Array(LocalGatewayRouteTableVpcAssociation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@local_gateway_route_table_vpc_associations || [] of LocalGatewayRouteTableVpcAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LocalGatewayRouteTableVpcAssociationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_vpc_associations: node.xpath_nodes("*[local-name()='localGatewayRouteTableVpcAssociationSet']/*[local-name()='item']").map { |n| LocalGatewayRouteTableVpcAssociation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_table_vpc_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_route_table_vpc_associations, @next_token)
  end
end
