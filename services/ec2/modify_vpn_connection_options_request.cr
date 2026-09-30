private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpnConnectionOptionsRequest
    # The ID of the Site-to-Site VPN connection.
    property vpn_connection_id : String

    # The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection.
    #
    # Default: `0.0.0.0/0`
    property local_ipv_4_network_cidr : String | Nil

    # The IPv4 CIDR on the Amazon Web Services side of the VPN connection.
    #
    # Default: `0.0.0.0/0`
    property remote_ipv_4_network_cidr : String | Nil

    # The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection.
    #
    # Default: `::/0`
    property local_ipv_6_network_cidr : String | Nil

    # The IPv6 CIDR on the Amazon Web Services side of the VPN connection.
    #
    # Default: `::/0`
    property remote_ipv_6_network_cidr : String | Nil

    # The desired bandwidth specification for the VPN connection. `standard` supports up to 1.25 Gbps
    # per tunnel, while `large` supports up to 5 Gbps per tunnel. Large bandwidth is only available
    # for VPN connections attached to a transit gateway or to Cloud WAN. The default value is
    # `standard`.
    property tunnel_bandwidth : VpnTunnelBandwidth | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpn_connection_id : String,
      @local_ipv_4_network_cidr : String | Nil = nil,
      @remote_ipv_4_network_cidr : String | Nil = nil,
      @local_ipv_6_network_cidr : String | Nil = nil,
      @remote_ipv_6_network_cidr : String | Nil = nil,
      @tunnel_bandwidth : VpnTunnelBandwidth | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      if value = @local_ipv_4_network_cidr
        params << {"#{prefix}LocalIpv4NetworkCidr", value}
      end

      if value = @remote_ipv_4_network_cidr
        params << {"#{prefix}RemoteIpv4NetworkCidr", value}
      end

      if value = @local_ipv_6_network_cidr
        params << {"#{prefix}LocalIpv6NetworkCidr", value}
      end

      if value = @remote_ipv_6_network_cidr
        params << {"#{prefix}RemoteIpv6NetworkCidr", value}
      end

      if value = @tunnel_bandwidth
        params << {"#{prefix}TunnelBandwidth", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        local_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalIpv4NetworkCidr']")),
        remote_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='RemoteIpv4NetworkCidr']")),
        local_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalIpv6NetworkCidr']")),
        remote_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='RemoteIpv6NetworkCidr']")),
        tunnel_bandwidth: (n = node.xpath_node("*[local-name()='TunnelBandwidth']")) ? AEC::VpnTunnelBandwidth.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@vpn_connection_id, @local_ipv_4_network_cidr, @remote_ipv_4_network_cidr, @local_ipv_6_network_cidr, @remote_ipv_6_network_cidr, @tunnel_bandwidth, @dry_run)
  end
end
