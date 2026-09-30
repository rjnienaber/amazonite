private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetActiveVpnTunnelStatusResult
    # Information about the current security configuration of the VPN tunnel.
    property active_vpn_tunnel_status : ActiveVpnTunnelStatus | Nil

    def initialize(
      @active_vpn_tunnel_status : ActiveVpnTunnelStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @active_vpn_tunnel_status
        params.concat(value.to_query_params("#{prefix}ActiveVpnTunnelStatus."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        active_vpn_tunnel_status: node.xpath_node("*[local-name()='activeVpnTunnelStatus']").try { |n| ActiveVpnTunnelStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @active_vpn_tunnel_status
        value.validate!
      end
    end

    def_equals_and_hash(@active_vpn_tunnel_status)
  end
end
