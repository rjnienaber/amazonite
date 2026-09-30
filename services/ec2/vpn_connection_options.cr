private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes VPN connection options.
  class VpnConnectionOptions
    # Indicates whether acceleration is enabled for the VPN connection.
    property enable_acceleration : Bool | Nil

    # Indicates whether the VPN connection uses static routes only. Static routes must be used for
    # devices that don't support BGP.
    property static_routes_only : Bool | Nil

    # The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection.
    property local_ipv_4_network_cidr : String | Nil

    # The IPv4 CIDR on the Amazon Web Services side of the VPN connection.
    property remote_ipv_4_network_cidr : String | Nil

    # The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection.
    property local_ipv_6_network_cidr : String | Nil

    # The IPv6 CIDR on the Amazon Web Services side of the VPN connection.
    property remote_ipv_6_network_cidr : String | Nil

    # The type of IPv4 address assigned to the outside interface of the customer gateway.
    #
    # Valid values: `PrivateIpv4` | `PublicIpv4` | `Ipv6`
    #
    # Default: `PublicIpv4`
    property outside_ip_address_type : String | Nil

    # The transit gateway attachment ID in use for the VPN tunnel.
    property transport_transit_gateway_attachment_id : String | Nil

    # Indicates whether the VPN tunnels process IPv4 or IPv6 traffic.
    property tunnel_inside_ip_version : TunnelInsideIpVersion | Nil

    # Indicates the VPN tunnel options.
    property tunnel_options : Array(TunnelOption) | Nil

    # The configured bandwidth for the VPN tunnel. Represents the current throughput capacity setting
    # for the tunnel connection. `standard` tunnel bandwidth supports up to 1.25 Gbps per tunnel while
    # `large` supports up to 5 Gbps per tunnel. If no tunnel bandwidth was specified for the
    # connection, `standard` is used as the default value.
    property tunnel_bandwidth : VpnTunnelBandwidth | Nil

    def initialize(
      @enable_acceleration : Bool | Nil = nil,
      @static_routes_only : Bool | Nil = nil,
      @local_ipv_4_network_cidr : String | Nil = nil,
      @remote_ipv_4_network_cidr : String | Nil = nil,
      @local_ipv_6_network_cidr : String | Nil = nil,
      @remote_ipv_6_network_cidr : String | Nil = nil,
      @outside_ip_address_type : String | Nil = nil,
      @transport_transit_gateway_attachment_id : String | Nil = nil,
      @tunnel_inside_ip_version : TunnelInsideIpVersion | Nil = nil,
      @tunnel_options : Array(TunnelOption) | Nil = nil,
      @tunnel_bandwidth : VpnTunnelBandwidth | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enable_acceleration
        params << {"#{prefix}EnableAcceleration", Core::QueryValue.bool(value)}
      end

      if value = @static_routes_only
        params << {"#{prefix}StaticRoutesOnly", Core::QueryValue.bool(value)}
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

      if value = @tunnel_inside_ip_version
        params << {"#{prefix}TunnelInsideIpVersion", value.to_json_object_key}
      end

      (@tunnel_options || [] of TunnelOption).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TunnelOptionSet.#{i}."))
      end

      if value = @tunnel_bandwidth
        params << {"#{prefix}TunnelBandwidth", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enable_acceleration: Core::XMLValue.bool(node.xpath_node("*[local-name()='enableAcceleration']")),
        static_routes_only: Core::XMLValue.bool(node.xpath_node("*[local-name()='staticRoutesOnly']")),
        local_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='localIpv4NetworkCidr']")),
        remote_ipv_4_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='remoteIpv4NetworkCidr']")),
        local_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='localIpv6NetworkCidr']")),
        remote_ipv_6_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='remoteIpv6NetworkCidr']")),
        outside_ip_address_type: Core::XMLValue.string(node.xpath_node("*[local-name()='outsideIpAddressType']")),
        transport_transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transportTransitGatewayAttachmentId']")),
        tunnel_inside_ip_version: (n = node.xpath_node("*[local-name()='tunnelInsideIpVersion']")) ? AEC::TunnelInsideIpVersion.from_json_object_key?(n.content) : nil,
        tunnel_options: node.xpath_nodes("*[local-name()='tunnelOptionSet']/*[local-name()='item']").map { |n| TunnelOption.from_xml(n) },
        tunnel_bandwidth: (n = node.xpath_node("*[local-name()='tunnelBandwidth']")) ? AEC::VpnTunnelBandwidth.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @tunnel_options
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@enable_acceleration, @static_routes_only, @local_ipv_4_network_cidr, @remote_ipv_4_network_cidr, @local_ipv_6_network_cidr, @remote_ipv_6_network_cidr, @outside_ip_address_type, @transport_transit_gateway_attachment_id, @tunnel_inside_ip_version, @tunnel_options, @tunnel_bandwidth)
  end
end
