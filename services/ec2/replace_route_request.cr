private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceRouteRequest
    # The ID of the prefix list for the route.
    property destination_prefix_list_id : String | Nil

    # The ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
    property vpc_endpoint_id : String | Nil

    # Specifies whether to reset the local route to its default target (`local`).
    property local_target : Bool | Nil

    # The ID of a transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # [IPv4 traffic only] The ID of a carrier gateway.
    property carrier_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of the core network.
    property core_network_arn : String | Nil

    # The Amazon Resource Name (ARN) of the ODB network.
    property odb_network_arn : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the route table.
    property route_table_id : String

    # The IPv4 CIDR address block used for the destination match. The value that you provide must
    # match the CIDR of an existing route in the table.
    property destination_cidr_block : String | Nil

    # The ID of an internet gateway or virtual private gateway.
    property gateway_id : String | Nil

    # The IPv6 CIDR address block used for the destination match. The value that you provide must
    # match the CIDR of an existing route in the table.
    property destination_ipv_6_cidr_block : String | Nil

    # [IPv6 traffic only] The ID of an egress-only internet gateway.
    property egress_only_internet_gateway_id : String | Nil

    # The ID of a NAT instance in your VPC.
    property instance_id : String | Nil

    # The ID of a network interface.
    property network_interface_id : String | Nil

    # The ID of a VPC peering connection.
    property vpc_peering_connection_id : String | Nil

    # [IPv4 traffic only] The ID of a NAT gateway.
    property nat_gateway_id : String | Nil

    def initialize(
      @route_table_id : String,
      @destination_prefix_list_id : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @local_target : Bool | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @carrier_gateway_id : String | Nil = nil,
      @core_network_arn : String | Nil = nil,
      @odb_network_arn : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @destination_cidr_block : String | Nil = nil,
      @gateway_id : String | Nil = nil,
      @destination_ipv_6_cidr_block : String | Nil = nil,
      @egress_only_internet_gateway_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
      @nat_gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_prefix_list_id
        params << {"#{prefix}DestinationPrefixListId", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @local_target
        params << {"#{prefix}LocalTarget", Core::QueryValue.bool(value)}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end

      if value = @carrier_gateway_id
        params << {"#{prefix}CarrierGatewayId", value}
      end

      if value = @core_network_arn
        params << {"#{prefix}CoreNetworkArn", value}
      end

      if value = @odb_network_arn
        params << {"#{prefix}OdbNetworkArn", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}RouteTableId", @route_table_id}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @gateway_id
        params << {"#{prefix}GatewayId", value}
      end

      if value = @destination_ipv_6_cidr_block
        params << {"#{prefix}DestinationIpv6CidrBlock", value}
      end

      if value = @egress_only_internet_gateway_id
        params << {"#{prefix}EgressOnlyInternetGatewayId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationPrefixListId']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcEndpointId']")),
        local_target: Core::XMLValue.bool(node.xpath_node("*[local-name()='LocalTarget']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalGatewayId']")),
        carrier_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CarrierGatewayId']")),
        core_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CoreNetworkArn']")),
        odb_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OdbNetworkArn']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")).not_nil!,
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayId']")),
        destination_ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationIpv6CidrBlock']")),
        egress_only_internet_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='egressOnlyInternetGatewayId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_prefix_list_id, @vpc_endpoint_id, @local_target, @transit_gateway_id, @local_gateway_id, @carrier_gateway_id, @core_network_arn, @odb_network_arn, @dry_run, @route_table_id, @destination_cidr_block, @gateway_id, @destination_ipv_6_cidr_block, @egress_only_internet_gateway_id, @instance_id, @network_interface_id, @vpc_peering_connection_id, @nat_gateway_id)
  end
end
