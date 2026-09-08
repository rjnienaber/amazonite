private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpnConnectionRequest
    # The ID of the VPN connection.
    property vpn_connection_id : String

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the customer gateway at your end of the VPN connection.
    property customer_gateway_id : String | Nil

    # The ID of the virtual private gateway at the Amazon Web Services side of the VPN connection.
    property vpn_gateway_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpn_connection_id : String,
      @transit_gateway_id : String | Nil = nil,
      @customer_gateway_id : String | Nil = nil,
      @vpn_gateway_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @customer_gateway_id
        params << {"#{prefix}CustomerGatewayId", value}
      end

      if value = @vpn_gateway_id
        params << {"#{prefix}VpnGatewayId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayId']")),
        customer_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomerGatewayId']")),
        vpn_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnGatewayId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_id, @transit_gateway_id, @customer_gateway_id, @vpn_gateway_id, @dry_run)
  end
end
