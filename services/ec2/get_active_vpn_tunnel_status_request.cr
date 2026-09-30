private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetActiveVpnTunnelStatusRequest
    # The ID of the VPN connection for which to retrieve the active tunnel status.
    property vpn_connection_id : String

    # The external IP address of the VPN tunnel for which to retrieve the active status.
    property vpn_tunnel_outside_ip_address : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request.
    property dry_run : Bool | Nil

    def initialize(
      @vpn_connection_id : String,
      @vpn_tunnel_outside_ip_address : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      params << {"#{prefix}VpnTunnelOutsideIpAddress", @vpn_tunnel_outside_ip_address}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        vpn_tunnel_outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnTunnelOutsideIpAddress']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_id, @vpn_tunnel_outside_ip_address, @dry_run)
  end
end
