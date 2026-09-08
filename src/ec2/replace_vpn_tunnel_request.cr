private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReplaceVpnTunnelRequest
    # The ID of the Site-to-Site VPN connection.
    property vpn_connection_id : String

    # The external IP address of the VPN tunnel.
    property vpn_tunnel_outside_ip_address : String

    # Trigger pending tunnel endpoint maintenance.
    property apply_pending_maintenance : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpn_connection_id : String,
      @vpn_tunnel_outside_ip_address : String,
      @apply_pending_maintenance : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      params << {"#{prefix}VpnTunnelOutsideIpAddress", @vpn_tunnel_outside_ip_address}

      if value = @apply_pending_maintenance
        params << {"#{prefix}ApplyPendingMaintenance", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        vpn_tunnel_outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnTunnelOutsideIpAddress']")).not_nil!,
        apply_pending_maintenance: Core::XMLValue.bool(node.xpath_node("*[local-name()='ApplyPendingMaintenance']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_id, @vpn_tunnel_outside_ip_address, @apply_pending_maintenance, @dry_run)
  end
end
