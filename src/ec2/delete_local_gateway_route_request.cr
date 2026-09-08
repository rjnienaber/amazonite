private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLocalGatewayRouteRequest
    # The CIDR range for the route. This must match the CIDR for the route exactly.
    property destination_cidr_block : String | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Use a prefix list in place of `DestinationCidrBlock`. You cannot use `DestinationPrefixListId`
    # and `DestinationCidrBlock` in the same request.
    property destination_prefix_list_id : String | Nil

    def initialize(
      @local_gateway_route_table_id : String,
      @destination_cidr_block : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @destination_prefix_list_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      params << {"#{prefix}LocalGatewayRouteTableId", @local_gateway_route_table_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @destination_prefix_list_id
        params << {"#{prefix}DestinationPrefixListId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")),
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayRouteTableId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPrefixListId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @local_gateway_route_table_id, @dry_run, @destination_prefix_list_id)
  end
end
