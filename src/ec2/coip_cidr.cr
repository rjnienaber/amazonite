private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a customer-owned IP address range.
  class CoipCidr
    # An address range in a customer-owned IP address space.
    property cidr : String | Nil

    # The ID of the address pool.
    property coip_pool_id : String | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @coip_pool_id : String | Nil = nil,
      @local_gateway_route_table_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @coip_pool_id
        params << {"#{prefix}CoipPoolId", value}
      end

      if value = @local_gateway_route_table_id
        params << {"#{prefix}LocalGatewayRouteTableId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        coip_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='coipPoolId']")),
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr, @coip_pool_id, @local_gateway_route_table_id)
  end
end
