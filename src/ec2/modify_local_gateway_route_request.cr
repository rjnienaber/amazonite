private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyLocalGatewayRouteRequest
    # The CIDR block used for destination matches. The value that you provide must match the CIDR of
    # an existing route in the table.
    property destination_cidr_block : String | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String

    # The ID of the virtual interface group.
    property local_gateway_virtual_interface_group_id : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the prefix list. Use a prefix list in place of `DestinationCidrBlock`. You cannot use
    # `DestinationPrefixListId` and `DestinationCidrBlock` in the same request.
    property destination_prefix_list_id : String | Nil

    def initialize(
      @local_gateway_route_table_id : String,
      @destination_cidr_block : String | Nil = nil,
      @local_gateway_virtual_interface_group_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
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

      if value = @local_gateway_virtual_interface_group_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

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
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayVirtualInterfaceGroupId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPrefixListId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @local_gateway_route_table_id, @local_gateway_virtual_interface_group_id, @network_interface_id, @dry_run, @destination_prefix_list_id)
  end
end
