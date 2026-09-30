private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a local gateway route table.
  class LocalGatewayRouteTable
    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    # The Amazon Resource Name (ARN) of the local gateway route table.
    property local_gateway_route_table_arn : String | Nil

    # The ID of the local gateway.
    property local_gateway_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The ID of the Amazon Web Services account that owns the local gateway route table.
    property owner_id : String | Nil

    # The state of the local gateway route table.
    property state : String | Nil

    # The tags assigned to the local gateway route table.
    property tags : Array(Tag) | Nil

    # The mode of the local gateway route table.
    property mode : LocalGatewayRouteTableMode | Nil

    # Information about the state change.
    property state_reason : StateReason | Nil

    def initialize(
      @local_gateway_route_table_id : String | Nil = nil,
      @local_gateway_route_table_arn : String | Nil = nil,
      @local_gateway_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @state : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @mode : LocalGatewayRouteTableMode | Nil = nil,
      @state_reason : StateReason | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @local_gateway_route_table_id
        params << {"#{prefix}LocalGatewayRouteTableId", value}
      end

      if value = @local_gateway_route_table_arn
        params << {"#{prefix}LocalGatewayRouteTableArn", value}
      end

      if value = @local_gateway_id
        params << {"#{prefix}LocalGatewayId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
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

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

      if value = @state_reason
        params.concat(value.to_query_params("#{prefix}StateReason."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
        local_gateway_route_table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableArn']")),
        local_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        mode: (n = node.xpath_node("*[local-name()='mode']")) ? AEC::LocalGatewayRouteTableMode.from_json_object_key?(n.content) : nil,
        state_reason: node.xpath_node("*[local-name()='stateReason']").try { |n| StateReason.from_xml(n) },
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

      if value = @state_reason
        value.validate!
      end
    end

    def_equals_and_hash(@local_gateway_route_table_id, @local_gateway_route_table_arn, @local_gateway_id, @outpost_arn, @owner_id, @state, @tags, @mode, @state_reason)
  end
end
