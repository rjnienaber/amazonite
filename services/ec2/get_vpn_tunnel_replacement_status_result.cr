private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetVpnTunnelReplacementStatusResult
    # The ID of the Site-to-Site VPN connection.
    property vpn_connection_id : String | Nil

    # The ID of the transit gateway associated with the VPN connection.
    property transit_gateway_id : String | Nil

    # The ID of the customer gateway.
    property customer_gateway_id : String | Nil

    # The ID of the virtual private gateway.
    property vpn_gateway_id : String | Nil

    # The external IP address of the VPN tunnel.
    property vpn_tunnel_outside_ip_address : String | Nil

    # Get details of pending tunnel endpoint maintenance.
    property maintenance_details : MaintenanceDetails | Nil

    def initialize(
      @vpn_connection_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @customer_gateway_id : String | Nil = nil,
      @vpn_gateway_id : String | Nil = nil,
      @vpn_tunnel_outside_ip_address : String | Nil = nil,
      @maintenance_details : MaintenanceDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpn_connection_id
        params << {"#{prefix}VpnConnectionId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @customer_gateway_id
        params << {"#{prefix}CustomerGatewayId", value}
      end

      if value = @vpn_gateway_id
        params << {"#{prefix}VpnGatewayId", value}
      end

      if value = @vpn_tunnel_outside_ip_address
        params << {"#{prefix}VpnTunnelOutsideIpAddress", value}
      end

      if value = @maintenance_details
        params.concat(value.to_query_params("#{prefix}MaintenanceDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnConnectionId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        customer_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='customerGatewayId']")),
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnGatewayId']")),
        vpn_tunnel_outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='vpnTunnelOutsideIpAddress']")),
        maintenance_details: node.xpath_node("*[local-name()='maintenanceDetails']").try { |n| MaintenanceDetails.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @maintenance_details
        value.validate!
      end
    end

    def_equals_and_hash(@vpn_connection_id, @transit_gateway_id, @customer_gateway_id, @vpn_gateway_id, @vpn_tunnel_outside_ip_address, @maintenance_details)
  end
end
