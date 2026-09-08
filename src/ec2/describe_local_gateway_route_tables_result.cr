private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLocalGatewayRouteTablesResult
    # Information about the local gateway route tables.
    property local_gateway_route_tables : Array(LocalGatewayRouteTable) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @local_gateway_route_tables : Array(LocalGatewayRouteTable) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@local_gateway_route_tables || [] of LocalGatewayRouteTable).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LocalGatewayRouteTableSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_tables: node.xpath_nodes("*[local-name()='localGatewayRouteTableSet']/*[local-name()='item']").map { |n| LocalGatewayRouteTable.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_tables
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_route_tables, @next_token)
  end
end
