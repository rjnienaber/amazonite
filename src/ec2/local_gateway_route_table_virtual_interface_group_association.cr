private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a local gateway route table and a virtual interface group.
  class LocalGatewayRouteTableVirtualInterfaceGroupAssociation
    # The ID of the association.
    property local_gateway_route_table_virtual_interface_group_association_id : String | Nil

    # The ID of the virtual interface group.
    property local_gateway_virtual_interface_group_id : String | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    # The Amazon Resource Name (ARN) of the local gateway route table for the virtual interface group.
    property local_gateway_route_table_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the local gateway virtual interface group
    # association.
    property owner_id : String | Nil

    # The state of the association.
    property state : String | Nil

    # The tags assigned to the association.
    property tags : Array(Tag) | Nil

    def initialize(
      @local_gateway_route_table_virtual_interface_group_association_id : String | Nil = nil,
      @local_gateway_virtual_interface_group_id : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @local_gateway_route_table_id : String | Nil = nil,
      @local_gateway_route_table_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_route_table_virtual_interface_group_association_id
        params << {"#{prefix}LocalGatewayRouteTableVirtualInterfaceGroupAssociationId", value}
      end

      if value = @local_gateway_virtual_interface_group_id
        params << {"#{prefix}LocalGatewayVirtualInterfaceGroupId", value}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
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

      if value = @state
        params << {"#{prefix}State", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_virtual_interface_group_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableVirtualInterfaceGroupAssociationId']")),
        local_gateway_virtual_interface_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayVirtualInterfaceGroupId']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
        local_gateway_route_table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @local_gateway_route_table_arn
        raise Core::ValidationError.new("LocalGatewayRouteTableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LocalGatewayRouteTableArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@local_gateway_route_table_virtual_interface_group_association_id, @local_gateway_virtual_interface_group_id, @local_gateway_id, @local_gateway_route_table_id, @local_gateway_route_table_arn, @owner_id, @state, @tags)
  end
end
