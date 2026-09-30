private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route table route.
  class AnalysisRouteTableRoute
    # The destination IPv4 address, in CIDR notation.
    property destination_cidr : String | Nil

    # The prefix of the Amazon Web Services service.
    property destination_prefix_list_id : String | Nil

    # The ID of an egress-only internet gateway.
    property egress_only_internet_gateway_id : String | Nil

    # The ID of the gateway, such as an internet gateway or virtual private gateway.
    property gateway_id : String | Nil

    # The ID of the instance, such as a NAT instance.
    property instance_id : String | Nil

    # The ID of a NAT gateway.
    property nat_gateway_id : String | Nil

    # The ID of a network interface.
    property network_interface_id : String | Nil

    # Describes how the route was created. The following are the possible values:
    #
    # - CreateRouteTable - The route was automatically created when the route table was created.
    #
    # - CreateRoute - The route was manually added to the route table.
    #
    # - EnableVgwRoutePropagation - The route was propagated by route propagation.
    property origin : String | Nil

    # The ID of a transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of a VPC peering connection.
    property vpc_peering_connection_id : String | Nil

    # The state. The following are the possible values:
    #
    # - active
    #
    # - blackhole
    property state : String | Nil

    # The ID of a carrier gateway.
    property carrier_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of a core network.
    property core_network_arn : String | Nil

    # The ID of a local gateway.
    property local_gateway_id : String | Nil

    def initialize(
      @destination_cidr : String | Nil = nil,
      @destination_prefix_list_id : String | Nil = nil,
      @egress_only_internet_gateway_id : String | Nil = nil,
      @gateway_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @nat_gateway_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @origin : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
      @state : String | Nil = nil,
      @carrier_gateway_id : String | Nil = nil,
      @core_network_arn : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr
        params << {"#{prefix}DestinationCidr", value}
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

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @origin
        params << {"#{prefix}Origin", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end

      if value = @state
        params << {"#{prefix}State", value}
      end

      if value = @carrier_gateway_id
        params << {"#{prefix}CarrierGatewayId", value}
      end

      if value = @core_network_arn
        params << {"#{prefix}CoreNetworkArn", value}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidr']")),
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationPrefixListId']")),
        egress_only_internet_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='egressOnlyInternetGatewayId']")),
        gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='gatewayId']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        origin: Core::XMLValue.string(node.xpath_node("*[local-name()='origin']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        carrier_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='carrierGatewayId']")),
        core_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkArn']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
      )
    end

    def validate! : Nil
      if value = @core_network_arn
        raise Core::ValidationError.new("CoreNetworkArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CoreNetworkArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@destination_cidr, @destination_prefix_list_id, @egress_only_internet_gateway_id, @gateway_id, @instance_id, @nat_gateway_id, @network_interface_id, @origin, @transit_gateway_id, @vpc_peering_connection_id, @state, @carrier_gateway_id, @core_network_arn, @local_gateway_id)
  end
end
