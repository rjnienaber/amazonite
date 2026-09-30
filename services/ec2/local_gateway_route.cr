private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route for a local gateway route table.
  class LocalGatewayRoute
    # The CIDR block used for destination matches.
    property destination_cidr_block : String | Nil

    # The ID of the virtual interface group.
    property local_gateway_virtual_interface_group_id : String | Nil

    # The route type.
    property type : LocalGatewayRouteType | Nil

    # The state of the route.
    property state : LocalGatewayRouteState | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    # The Amazon Resource Name (ARN) of the local gateway route table.
    property local_gateway_route_table_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the local gateway route.
    property owner_id : String | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The ID of the customer-owned address pool.
    property coip_pool_id : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The ID of the prefix list.
    property destination_prefix_list_id : String | Nil

    def initialize(
      @destination_cidr_block : String | Nil = nil,
      @local_gateway_virtual_interface_group_id : String | Nil = nil,
      @type : LocalGatewayRouteType | Nil = nil,
      @state : LocalGatewayRouteState | Nil = nil,
      @local_gateway_route_table_id : String | Nil = nil,
      @local_gateway_route_table_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @coip_pool_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @destination_prefix_list_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @local_gateway_virtual_interface_group_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @local_gateway_route_table_id
        params << {"#{prefix}LocalGatewayRouteTableId", value}
      end

      if value = @local_gateway_route_table_arn
        params << {"#{prefix}LocalGatewayRouteTableArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @coip_pool_id
        params << {"#{prefix}CoipPoolId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @destination_prefix_list_id
        params << {"#{prefix}DestinationPrefixListId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroupId']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::LocalGatewayRouteType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::LocalGatewayRouteState.from_json_object_key?(n.content) : nil,
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
        local_gateway_route_table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        coip_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='coipPoolId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        destination_prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationPrefixListId']")),
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_table_arn
        raise Core::ValidationError.new("LocalGatewayRouteTableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LocalGatewayRouteTableArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@destination_cidr_block, @local_gateway_virtual_interface_group_id, @type, @state, @local_gateway_route_table_id, @local_gateway_route_table_arn, @owner_id, @subnet_id, @coip_pool_id, @network_interface_id, @destination_prefix_list_id)
  end
end
