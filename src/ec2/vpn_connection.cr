private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPN connection.
  class VpnConnection
    # The category of the VPN connection. A value of `VPN` indicates an Amazon Web Services VPN
    # connection. A value of `VPN-Classic` indicates an Amazon Web Services Classic VPN connection.
    property category : String | Nil

    # The ID of the transit gateway associated with the VPN connection.
    property transit_gateway_id : String | Nil

    # The ID of the VPN concentrator associated with the VPN connection.
    property vpn_concentrator_id : String | Nil

    # The ARN of the core network.
    property core_network_arn : String | Nil

    # The ARN of the core network attachment.
    property core_network_attachment_arn : String | Nil

    # The current state of the gateway association.
    property gateway_association_state : GatewayAssociationState | Nil

    # The VPN connection options.
    property options : VpnConnectionOptions | Nil

    # The static routes associated with the VPN connection.
    property routes : Array(VpnStaticRoute) | Nil

    # Any tags assigned to the VPN connection.
    property tags : Array(Tag) | Nil

    # Information about the VPN tunnel.
    property vgw_telemetry : Array(VgwTelemetry) | Nil

    # The Amazon Resource Name (ARN) of the Secrets Manager secret storing the pre-shared key(s) for
    # the VPN connection.
    property pre_shared_key_arn : String | Nil

    # The ID of the VPN connection.
    property vpn_connection_id : String | Nil

    # The current state of the VPN connection.
    property state : VpnState | Nil

    # The configuration information for the VPN connection's customer gateway (in the native XML
    # format). This element is always present in the CreateVpnConnection response; however, it's
    # present in the DescribeVpnConnections response only if the VPN connection is in the `pending` or
    # `available` state.
    property customer_gateway_configuration : String | Nil

    # The type of VPN connection.
    property type : GatewayType | Nil

    # The ID of the customer gateway at your end of the VPN connection.
    property customer_gateway_id : String | Nil

    # The ID of the virtual private gateway at the Amazon Web Services side of the VPN connection.
    property vpn_gateway_id : String | Nil

    def initialize(
      @category : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @vpn_concentrator_id : String | Nil = nil,
      @core_network_arn : String | Nil = nil,
      @core_network_attachment_arn : String | Nil = nil,
      @gateway_association_state : GatewayAssociationState | Nil = nil,
      @options : VpnConnectionOptions | Nil = nil,
      @routes : Array(VpnStaticRoute) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vgw_telemetry : Array(VgwTelemetry) | Nil = nil,
      @pre_shared_key_arn : String | Nil = nil,
      @vpn_connection_id : String | Nil = nil,
      @state : VpnState | Nil = nil,
      @customer_gateway_configuration : String | Nil = nil,
      @type : GatewayType | Nil = nil,
      @customer_gateway_id : String | Nil = nil,
      @vpn_gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @category
        params << {"#{prefix}Category", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @vpn_concentrator_id
        params << {"#{prefix}VpnConcentratorId", value}
      end

      if value = @core_network_arn
        params << {"#{prefix}CoreNetworkArn", value}
      end

      if value = @core_network_attachment_arn
        params << {"#{prefix}CoreNetworkAttachmentArn", value}
      end

      if value = @gateway_association_state
        params << {"#{prefix}GatewayAssociationState", value.to_json_object_key}
      end

      if value = @options
        params.concat(value.to_query_params("#{prefix}Options."))
      end

      (@routes || [] of VpnStaticRoute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Routes.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@vgw_telemetry || [] of VgwTelemetry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VgwTelemetry.#{i}."))
      end

      if value = @pre_shared_key_arn
        params << {"#{prefix}PreSharedKeyArn", value}
      end

      if value = @vpn_connection_id
        params << {"#{prefix}VpnConnectionId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @customer_gateway_configuration
        params << {"#{prefix}CustomerGatewayConfiguration", value}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @customer_gateway_id
        params << {"#{prefix}CustomerGatewayId", value}
      end

      if value = @vpn_gateway_id
        params << {"#{prefix}VpnGatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        category: Core::XMLValue.string(node.xpath_node("*[local-name()='category']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        vpn_concentrator_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConcentratorId']")),
        core_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkArn']")),
        core_network_attachment_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkAttachmentArn']")),
        gateway_association_state: (n = node.xpath_node("*[local-name()='gatewayAssociationState']")) ? AEC::GatewayAssociationState.from_json_object_key?(n.content) : nil,
        options: node.xpath_node("*[local-name()='options']").try { |n| VpnConnectionOptions.from_xml(n) },
        routes: node.xpath_nodes("*[local-name()='routes']/*[local-name()='item']").map { |n| VpnStaticRoute.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vgw_telemetry: node.xpath_nodes("*[local-name()='vgwTelemetry']/*[local-name()='item']").map { |n| VgwTelemetry.from_xml(n) },
        pre_shared_key_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='preSharedKeyArn']")),
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConnectionId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpnState.from_json_object_key?(n.content) : nil,
        customer_gateway_configuration: Core::XMLValue.string(node.xpath_node("*[local-name()='customerGatewayConfiguration']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::GatewayType.from_json_object_key?(n.content) : nil,
        customer_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='customerGatewayId']")),
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnGatewayId']")),
      )
    end

    def validate! : Nil
      if value = @options
        value.validate!
      end

      if value = @routes
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @vgw_telemetry
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@category, @transit_gateway_id, @vpn_concentrator_id, @core_network_arn, @core_network_attachment_arn, @gateway_association_state, @options, @routes, @tags, @vgw_telemetry, @pre_shared_key_arn, @vpn_connection_id, @state, @customer_gateway_configuration, @type, @customer_gateway_id, @vpn_gateway_id)
  end
end
