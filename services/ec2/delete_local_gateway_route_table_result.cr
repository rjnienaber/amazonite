private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLocalGatewayRouteTableResult
    # Information about the local gateway route table.
    property local_gateway_route_table : LocalGatewayRouteTable | Nil

    def initialize(
      @local_gateway_route_table : LocalGatewayRouteTable | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_route_table
        params.concat(value.to_query_params("#{prefix}LocalGatewayRouteTable."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table: node.xpath_node("*[local-name()='localGatewayRouteTable']").try { |n| LocalGatewayRouteTable.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_table
        value.validate!
      end
    end

    def_equals_and_hash(@local_gateway_route_table)
  end
end
