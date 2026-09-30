private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route in a route table.
  class Route
    # The IPv4 CIDR block used for the destination match.
    property destination_cidr_block : String | Nil

    # The IPv6 CIDR block used for the destination match.
    property destination_ipv_6_cidr_block : String | Nil

    # The prefix of the Amazon Web Services service.
    property destination_prefix_list_id : String | Nil

    # The ID of the egress-only internet gateway.
    property egress_only_internet_gateway_id : String | Nil

    # The ID of a gateway attached to your VPC.
    property gateway_id : String | Nil

    # The ID of a NAT instance in your VPC.
    property instance_id : String | Nil

    # The ID of Amazon Web Services account that owns the instance.
    property instance_owner_id : String | Nil

    # The ID of a NAT gateway.
    property nat_gateway_id : String | Nil

    # The ID of a transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The ID of the carrier gateway.
    property carrier_gateway_id : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # Describes how the route was created.
    #
    # - `CreateRouteTable` - The route was automatically created when the route table was created.
    #
    # - `CreateRoute` - The route was manually added to the route table.
    #
    # - `EnableVgwRoutePropagation` - The route was propagated by route propagation.
    #
    # - `Advertisement` - The route was created dynamically by Amazon VPC Route Server.
    property origin : RouteOrigin | Nil

    # The state of the route. The `blackhole` state indicates that the route's target isn't available
    # (for example, the specified gateway isn't attached to the VPC, or the specified NAT instance has
    # been terminated).
    property state : RouteState | Nil

    # The ID of a VPC peering connection.
    property vpc_peering_connection_id : String | Nil

    # The Amazon Resource Name (ARN) of the core network.
    property core_network_arn : String | Nil

    # The Amazon Resource Name (ARN) of the ODB network.
    property odb_network_arn : String | Nil

    # The next hop IP address for routes propagated by VPC Route Server into VPC route tables.
    property ip_address : String | Nil

    def initialize(
      @destination_cidr_block : String | Nil = nil,
      @destination_ipv_6_cidr_block : String | Nil = nil,
      @destination_prefix_list_id : String | Nil = nil,
      @egress_only_internet_gateway_id : String | Nil = nil,
      @gateway_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_owner_id : String | Nil = nil,
      @nat_gateway_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @carrier_gateway_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @origin : RouteOrigin | Nil = nil,
      @state : RouteState | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
      @core_network_arn : String | Nil = nil,
      @odb_network_arn : String | Nil = nil,
      @ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @destination_ipv_6_cidr_block
        params << {"#{prefix}DestinationIpv6CidrBlock", value}
      end

      if value = @destination_prefix_list_id
        params << {"#{prefix}DestinationPrefixListId", value}
      end

      if value = @egress_only_internet_gateway_id
        params << {"#{prefix}EgressOnlyInternetGatewayId", value}
      end

      if value = @gateway_id
        params << {"#{prefix}GatewayId", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @instance_owner_id
        params << {"#{prefix}InstanceOwnerId", value}
      end

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
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

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @origin
        params << {"#{prefix}Origin", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end

      if value = @core_network_arn
        params << {"#{prefix}CoreNetworkArn", value}
      end

      if value = @odb_network_arn
        params << {"#{prefix}OdbNetworkArn", value}
      end

      if value = @ip_address
        params << {"#{prefix}IpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        destination_ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationIpv6CidrBlock']")),
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationPrefixListId']")),
        egress_only_internet_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='egressOnlyInternetGatewayId']")),
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        instance_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceOwnerId']")),
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        carrier_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierGatewayId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        origin: (n = node.xpath_node("*[local-name()='origin']")) ? AEC::RouteOrigin.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteState.from_json_object_key?(n.content) : nil,
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
        core_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkArn']")),
        odb_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='odbNetworkArn']")),
        ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipAddress']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @destination_ipv_6_cidr_block, @destination_prefix_list_id, @egress_only_internet_gateway_id, @gateway_id, @instance_id, @instance_owner_id, @nat_gateway_id, @transit_gateway_id, @local_gateway_id, @carrier_gateway_id, @network_interface_id, @origin, @state, @vpc_peering_connection_id, @core_network_arn, @odb_network_arn, @ip_address)
  end
end
