private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Client VPN endpoint.
  class ClientVpnEndpoint
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String | Nil

    # A brief description of the endpoint.
    property description : String | Nil

    # The current state of the Client VPN endpoint.
    property status : ClientVpnEndpointStatus | Nil

    # The date and time the Client VPN endpoint was created.
    property creation_time : String | Nil

    # The date and time the Client VPN endpoint was deleted, if applicable.
    property deletion_time : String | Nil

    # The DNS name to be used by clients when connecting to the Client VPN endpoint.
    property dns_name : String | Nil

    # The IPv4 address range, in CIDR notation, from which client IP addresses are assigned.
    property client_cidr_block : String | Nil

    # Information about the DNS servers to be used for DNS resolution.
    property dns_servers : Array(String) | Nil

    # Indicates whether split-tunnel is enabled in the Client VPN endpoint.
    #
    # For information about split-tunnel VPN endpoints, see [Split-Tunnel Client VPN
    # endpoint](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/split-tunnel-vpn.html) in the
    # *Client VPN Administrator Guide*.
    property split_tunnel : Bool | Nil

    # The protocol used by the VPN session.
    property vpn_protocol : VpnProtocol | Nil

    # The transport protocol used by the Client VPN endpoint.
    property transport_protocol : TransportProtocol | Nil

    # The port number for the Client VPN endpoint.
    property vpn_port : Int32 | Nil

    # Information about the associated target networks. A target network is a subnet in a VPC.
    property associated_target_networks : Array(AssociatedTargetNetwork) | Nil

    # The ARN of the server certificate.
    property server_certificate_arn : String | Nil

    # Information about the authentication method used by the Client VPN endpoint.
    property authentication_options : Array(ClientVpnAuthentication) | Nil

    # Information about the client connection logging options for the Client VPN endpoint.
    property connection_log_options : ConnectionLogResponseOptions | Nil

    # Any tags assigned to the Client VPN endpoint.
    property tags : Array(Tag) | Nil

    # The IDs of the security groups for the target network.
    property security_group_ids : Array(String) | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The URL of the self-service portal.
    property self_service_portal_url : String | Nil

    # The options for managing connection authorization for new client connections.
    property client_connect_options : ClientConnectResponseOptions | Nil

    # The maximum VPN session duration time in hours.
    #
    # Valid values: `8 | 10 | 12 | 24`
    #
    # Default value: `24`
    property session_timeout_hours : Int32 | Nil

    # Options for enabling a customizable text banner that will be displayed on Amazon Web Services
    # provided clients when a VPN session is established.
    property client_login_banner_options : ClientLoginBannerResponseOptions | Nil

    # Client route enforcement is a feature of the Client VPN service that helps enforce administrator
    # defined routes on devices connected through the VPN. T his feature helps improve your security
    # posture by ensuring that network traffic originating from a connected client is not
    # inadvertently sent outside the VPN tunnel.
    #
    # Client route enforcement works by monitoring the route table of a connected device for routing
    # policy changes to the VPN connection. If the feature detects any VPN routing policy
    # modifications, it will automatically force an update to the route table, reverting it back to
    # the expected route configurations.
    property client_route_enforcement_options : ClientRouteEnforcementResponseOptions | Nil

    # Indicates whether the client VPN session is disconnected after the maximum `sessionTimeoutHours`
    # is reached. If `true`, users are prompted to reconnect client VPN. If `false`, client VPN
    # attempts to reconnect automatically. The default value is `true`.
    property disconnect_on_session_timeout : Bool | Nil

    # The IP address type of the Client VPN endpoint. Possible values are `ipv4` for IPv4 addressing
    # only, `ipv6` for IPv6 addressing only, or `dual-stack `for both IPv4 and IPv6 addressing.
    property endpoint_ip_address_type : EndpointIpAddressType | Nil

    # The IP address type of the Client VPN endpoint. Possible values are either `ipv4` for IPv4
    # addressing only, `ipv6` for IPv6 addressing only, or `dual-stack` for both IPv4 and IPv6
    # addressing.
    property traffic_ip_address_type : TrafficIpAddressType | Nil

    # The Transit Gateway configuration for the Client VPN endpoint.
    property transit_gateway_configuration : TransitGatewayConfigurationDescribeEndpointStructure | Nil

    def initialize(
      @client_vpn_endpoint_id : String | Nil = nil,
      @description : String | Nil = nil,
      @status : ClientVpnEndpointStatus | Nil = nil,
      @creation_time : String | Nil = nil,
      @deletion_time : String | Nil = nil,
      @dns_name : String | Nil = nil,
      @client_cidr_block : String | Nil = nil,
      @dns_servers : Array(String) | Nil = nil,
      @split_tunnel : Bool | Nil = nil,
      @vpn_protocol : VpnProtocol | Nil = nil,
      @transport_protocol : TransportProtocol | Nil = nil,
      @vpn_port : Int32 | Nil = nil,
      @associated_target_networks : Array(AssociatedTargetNetwork) | Nil = nil,
      @server_certificate_arn : String | Nil = nil,
      @authentication_options : Array(ClientVpnAuthentication) | Nil = nil,
      @connection_log_options : ConnectionLogResponseOptions | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @self_service_portal_url : String | Nil = nil,
      @client_connect_options : ClientConnectResponseOptions | Nil = nil,
      @session_timeout_hours : Int32 | Nil = nil,
      @client_login_banner_options : ClientLoginBannerResponseOptions | Nil = nil,
      @client_route_enforcement_options : ClientRouteEnforcementResponseOptions | Nil = nil,
      @disconnect_on_session_timeout : Bool | Nil = nil,
      @endpoint_ip_address_type : EndpointIpAddressType | Nil = nil,
      @traffic_ip_address_type : TrafficIpAddressType | Nil = nil,
      @transit_gateway_configuration : TransitGatewayConfigurationDescribeEndpointStructure | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_vpn_endpoint_id
        params << {"#{prefix}ClientVpnEndpointId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end

      if value = @deletion_time
        params << {"#{prefix}DeletionTime", value}
      end

      if value = @dns_name
        params << {"#{prefix}DnsName", value}
      end

      if value = @client_cidr_block
        params << {"#{prefix}ClientCidrBlock", value}
      end

      (@dns_servers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DnsServer.#{i}", item}
      end

      if value = @split_tunnel
        params << {"#{prefix}SplitTunnel", Core::QueryValue.bool(value)}
      end

      if value = @vpn_protocol
        params << {"#{prefix}VpnProtocol", value.to_json_object_key}
      end

      if value = @transport_protocol
        params << {"#{prefix}TransportProtocol", value.to_json_object_key}
      end

      if value = @vpn_port
        params << {"#{prefix}VpnPort", value.to_s}
      end

      (@associated_target_networks || [] of AssociatedTargetNetwork).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssociatedTargetNetwork.#{i}."))
      end

      if value = @server_certificate_arn
        params << {"#{prefix}ServerCertificateArn", value}
      end

      (@authentication_options || [] of ClientVpnAuthentication).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AuthenticationOptions.#{i}."))
      end

      if value = @connection_log_options
        params.concat(value.to_query_params("#{prefix}ConnectionLogOptions."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupIdSet.#{i}", item}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @self_service_portal_url
        params << {"#{prefix}SelfServicePortalUrl", value}
      end

      if value = @client_connect_options
        params.concat(value.to_query_params("#{prefix}ClientConnectOptions."))
      end

      if value = @session_timeout_hours
        params << {"#{prefix}SessionTimeoutHours", value.to_s}
      end

      if value = @client_login_banner_options
        params.concat(value.to_query_params("#{prefix}ClientLoginBannerOptions."))
      end

      if value = @client_route_enforcement_options
        params.concat(value.to_query_params("#{prefix}ClientRouteEnforcementOptions."))
      end

      if value = @disconnect_on_session_timeout
        params << {"#{prefix}DisconnectOnSessionTimeout", Core::QueryValue.bool(value)}
      end

      if value = @endpoint_ip_address_type
        params << {"#{prefix}EndpointIpAddressType", value.to_json_object_key}
      end

      if value = @traffic_ip_address_type
        params << {"#{prefix}TrafficIpAddressType", value.to_json_object_key}
      end

      if value = @transit_gateway_configuration
        params.concat(value.to_query_params("#{prefix}TransitGatewayConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='clientVpnEndpointId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnEndpointStatus.from_xml(n) },
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
        deletion_time: Core::XMLValue.string(node.xpath_node("*[local-name()='deletionTime']")),
        dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
        client_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='clientCidrBlock']")),
        dns_servers: node.xpath_nodes("*[local-name()='dnsServer']/*[local-name()='item']").map { |n| n.content },
        split_tunnel: Core::XMLValue.bool(node.xpath_node("*[local-name()='splitTunnel']")),
        vpn_protocol: (n = node.xpath_node("*[local-name()='vpnProtocol']")) ? AEC::VpnProtocol.from_json_object_key?(n.content) : nil,
        transport_protocol: (n = node.xpath_node("*[local-name()='transportProtocol']")) ? AEC::TransportProtocol.from_json_object_key?(n.content) : nil,
        vpn_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='vpnPort']")),
        associated_target_networks: node.xpath_nodes("*[local-name()='associatedTargetNetwork']/*[local-name()='item']").map { |n| AssociatedTargetNetwork.from_xml(n) },
        server_certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='serverCertificateArn']")),
        authentication_options: node.xpath_nodes("*[local-name()='authenticationOptions']/*[local-name()='item']").map { |n| ClientVpnAuthentication.from_xml(n) },
        connection_log_options: node.xpath_node("*[local-name()='connectionLogOptions']").try { |n| ConnectionLogResponseOptions.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        security_group_ids: node.xpath_nodes("*[local-name()='securityGroupIdSet']/*[local-name()='item']").map { |n| n.content },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        self_service_portal_url: Core::XMLValue.string(node.xpath_node("*[local-name()='selfServicePortalUrl']")),
        client_connect_options: node.xpath_node("*[local-name()='clientConnectOptions']").try { |n| ClientConnectResponseOptions.from_xml(n) },
        session_timeout_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='sessionTimeoutHours']")),
        client_login_banner_options: node.xpath_node("*[local-name()='clientLoginBannerOptions']").try { |n| ClientLoginBannerResponseOptions.from_xml(n) },
        client_route_enforcement_options: node.xpath_node("*[local-name()='clientRouteEnforcementOptions']").try { |n| ClientRouteEnforcementResponseOptions.from_xml(n) },
        disconnect_on_session_timeout: Core::XMLValue.bool(node.xpath_node("*[local-name()='disconnectOnSessionTimeout']")),
        endpoint_ip_address_type: (n = node.xpath_node("*[local-name()='endpointIpAddressType']")) ? AEC::EndpointIpAddressType.from_json_object_key?(n.content) : nil,
        traffic_ip_address_type: (n = node.xpath_node("*[local-name()='trafficIpAddressType']")) ? AEC::TrafficIpAddressType.from_json_object_key?(n.content) : nil,
        transit_gateway_configuration: node.xpath_node("*[local-name()='transitGatewayConfiguration']").try { |n| TransitGatewayConfigurationDescribeEndpointStructure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end

      if value = @associated_target_networks
        value.each(&.validate!)
      end

      if value = @authentication_options
        value.each(&.validate!)
      end

      if value = @connection_log_options
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @client_connect_options
        value.validate!
      end

      if value = @client_login_banner_options
        value.validate!
      end

      if value = @client_route_enforcement_options
        value.validate!
      end

      if value = @transit_gateway_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @description, @status, @creation_time, @deletion_time, @dns_name, @client_cidr_block, @dns_servers, @split_tunnel, @vpn_protocol, @transport_protocol, @vpn_port, @associated_target_networks, @server_certificate_arn, @authentication_options, @connection_log_options, @tags, @security_group_ids, @vpc_id, @self_service_portal_url, @client_connect_options, @session_timeout_hours, @client_login_banner_options, @client_route_enforcement_options, @disconnect_on_session_timeout, @endpoint_ip_address_type, @traffic_ip_address_type, @transit_gateway_configuration)
  end
end
