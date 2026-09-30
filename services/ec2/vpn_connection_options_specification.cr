private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes VPN connection options.
  class VpnConnectionOptionsSpecification
    # Indicate whether to enable acceleration for the VPN connection.
    #
    # Default: `false`
    property enable_acceleration : Bool | Nil

    # Indicate whether the VPN tunnels process IPv4 or IPv6 traffic.
    #
    # Default: `ipv4`
    property tunnel_inside_ip_version : TunnelInsideIpVersion | Nil

    # The tunnel options for the VPN connection.
    property tunnel_options : Array(VpnTunnelOptionsSpecification) | Nil

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

    # The type of IP address assigned to the outside interface of the customer gateway device.
    #
    # Valid values: `PrivateIpv4` | `PublicIpv4` | `Ipv6`
    #
    # Default: `PublicIpv4`
    property outside_ip_address_type : String | Nil

    # The transit gateway attachment ID to use for the VPN tunnel.
    #
    # Required if `OutsideIpAddressType` is set to `PrivateIpv4`.
    property transport_transit_gateway_attachment_id : String | Nil

    # The desired bandwidth specification for the VPN tunnel, used when creating or modifying VPN
    # connection options to set the tunnel's throughput capacity. `standard` supports up to 1.25 Gbps
    # per tunnel, while `large` supports up to 5 Gbps per tunnel. The default value is `standard`.
    # Existing VPN connections without a bandwidth setting will automatically default to `standard`.
    property tunnel_bandwidth : VpnTunnelBandwidth | Nil

    # Indicate whether the VPN connection uses static routes only. If you are creating a VPN
    # connection for a device that does not support BGP, you must specify `true`. Use
    # CreateVpnConnectionRoute to create a static route.
    #
    # Default: `false`
    property static_routes_only : Bool | Nil

    def initialize(
      @enable_acceleration : Bool | Nil = nil,
      @tunnel_inside_ip_version : TunnelInsideIpVersion | Nil = nil,
      @tunnel_options : Array(VpnTunnelOptionsSpecification) | Nil = nil,
      @local_ipv_4_network_cidr : String | Nil = nil,
      @remote_ipv_4_network_cidr : String | Nil = nil,
      @local_ipv_6_network_cidr : String | Nil = nil,
      @remote_ipv_6_network_cidr : String | Nil = nil,
      @outside_ip_address_type : String | Nil = nil,
      @transport_transit_gateway_attachment_id : String | Nil = nil,
      @tunnel_bandwidth : VpnTunnelBandwidth | Nil = nil,
      @static_routes_only : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enable_acceleration
        params << {"#{prefix}EnableAcceleration", Core::QueryValue.bool(value)}
      end

      if value = @tunnel_inside_ip_version
        params << {"#{prefix}TunnelInsideIpVersion", value.to_json_object_key}
      end

      (@tunnel_options || [] of VpnTunnelOptionsSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TunnelOptions.#{i}."))
      end

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

      if value = @outside_ip_address_type
        params << {"#{prefix}OutsideIpAddressType", value}
      end

      if value = @transport_transit_gateway_attachment_id
        params << {"#{prefix}TransportTransitGatewayAttachmentId", value}
      end

      if value = @tunnel_bandwidth
        params << {"#{prefix}TunnelBandwidth", value.to_json_object_key}
      end

      if value = @static_routes_only
        params << {"#{prefix}StaticRoutesOnly", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enable_acceleration: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableAcceleration']")),
        tunnel_inside_ip_version: (n = node.xpath_node("*[local-name()='TunnelInsideIpVersion']")) ? AEC::TunnelInsideIpVersion.from_json_object_key?(n.content) : nil,
        tunnel_options: node.xpath_nodes("*[local-name()='TunnelOptions']/*[local-name()='item']").map { |n| VpnTunnelOptionsSpecification.from_xml(n) },
        local_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalIpv4NetworkCidr']")),
        remote_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='RemoteIpv4NetworkCidr']")),
        local_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='LocalIpv6NetworkCidr']")),
        remote_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='RemoteIpv6NetworkCidr']")),
        outside_ip_address_type: Core::XMLValue.string(node.xpath_node("*[local-name()='OutsideIpAddressType']")),
        transport_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransportTransitGatewayAttachmentId']")),
        tunnel_bandwidth: (n = node.xpath_node("*[local-name()='TunnelBandwidth']")) ? AEC::VpnTunnelBandwidth.from_json_object_key?(n.content) : nil,
        static_routes_only: Core::XMLValue.bool(node.xpath_node("*[local-name()='staticRoutesOnly']")),
      )
    end

    def validate! : Nil
      if value = @tunnel_options
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@enable_acceleration, @tunnel_inside_ip_version, @tunnel_options, @local_ipv_4_network_cidr, @remote_ipv_4_network_cidr, @local_ipv_6_network_cidr, @remote_ipv_6_network_cidr, @outside_ip_address_type, @transport_transit_gateway_attachment_id, @tunnel_bandwidth, @static_routes_only)
  end
end
