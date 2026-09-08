private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateClientVpnEndpointRequest
    # The IPv4 address range, in CIDR notation, from which to assign client IP addresses. The address
    # range cannot overlap with the local CIDR of the VPC in which the associated subnet is located,
    # or the routes that you add manually. The address range cannot be changed after the Client VPN
    # endpoint has been created. Client CIDR range must have a size of at least /22 and must not be
    # greater than /12.
    property client_cidr_block : String | Nil

    # The ARN of the server certificate. For more information, see the [Certificate Manager User
    # Guide](https://docs.aws.amazon.com/acm/latest/userguide/).
    property server_certificate_arn : String

    # Information about the authentication method to be used to authenticate clients.
    property authentication_options : Array(ClientVpnAuthenticationRequest) = [] of ClientVpnAuthenticationRequest

    # Information about the client connection logging options.
    #
    # If you enable client connection logging, data about client connections is sent to a Cloudwatch
    # Logs log stream. The following information is logged:
    #
    # - Client connection requests
    #
    # - Client connection results (successful and unsuccessful)
    #
    # - Reasons for unsuccessful client connection requests
    #
    # - Client connection termination time
    property connection_log_options : ConnectionLogOptions

    # Information about the DNS servers to be used for DNS resolution. A Client VPN endpoint can have
    # up to two DNS servers. If no DNS server is specified, the DNS address configured on the device
    # is used for the DNS server.
    property dns_servers : Array(String) | Nil

    # The transport protocol to be used by the VPN session.
    #
    # Default value: `udp`
    property transport_protocol : TransportProtocol | Nil

    # The port number to assign to the Client VPN endpoint for TCP and UDP traffic.
    #
    # Valid Values: `443` | `1194`
    #
    # Default Value: `443`
    property vpn_port : Int32 | Nil

    # A brief description of the Client VPN endpoint.
    property description : String | Nil

    # Indicates whether split-tunnel is enabled on the Client VPN endpoint.
    #
    # By default, split-tunnel on a VPN endpoint is disabled.
    #
    # For information about split-tunnel VPN endpoints, see [Split-tunnel Client VPN
    # endpoint](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/split-tunnel-vpn.html) in the
    # *Client VPN Administrator Guide*.
    property split_tunnel : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The tags to apply to the Client VPN endpoint during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # The IDs of one or more security groups to apply to the target network. You must also specify the
    # ID of the VPC that contains the security groups.
    property security_group_ids : Array(String) | Nil

    # The ID of the VPC to associate with the Client VPN endpoint. If no security group IDs are
    # specified in the request, the default security group for the VPC is applied.
    property vpc_id : String | Nil

    # Specify whether to enable the self-service portal for the Client VPN endpoint.
    #
    # Default Value: `enabled`
    property self_service_portal : SelfServicePortal | Nil

    # The options for managing connection authorization for new client connections.
    property client_connect_options : ClientConnectOptions | Nil

    # The maximum VPN session duration time in hours.
    #
    # Valid values: `8 | 10 | 12 | 24`
    #
    # Default value: `24`
    property session_timeout_hours : Int32 | Nil

    # Options for enabling a customizable text banner that will be displayed on Amazon Web Services
    # provided clients when a VPN session is established.
    property client_login_banner_options : ClientLoginBannerOptions | Nil

    # Client route enforcement is a feature of the Client VPN service that helps enforce administrator
    # defined routes on devices connected through the VPN. T his feature helps improve your security
    # posture by ensuring that network traffic originating from a connected client is not
    # inadvertently sent outside the VPN tunnel.
    #
    # Client route enforcement works by monitoring the route table of a connected device for routing
    # policy changes to the VPN connection. If the feature detects any VPN routing policy
    # modifications, it will automatically force an update to the route table, reverting it back to
    # the expected route configurations.
    property client_route_enforcement_options : ClientRouteEnforcementOptions | Nil

    # Indicates whether the client VPN session is disconnected after the maximum timeout specified in
    # `SessionTimeoutHours` is reached. If `true`, users are prompted to reconnect client VPN. If
    # `false`, client VPN attempts to reconnect automatically. The default value is `true`.
    property disconnect_on_session_timeout : Bool | Nil

    # The IP address type for the Client VPN endpoint. Valid values are `ipv4` (default) for IPv4
    # addressing only, `ipv6` for IPv6 addressing only, or `dual-stack` for both IPv4 and IPv6
    # addressing. When set to `dual-stack,` clients can connect to the endpoint using either IPv4 or
    # IPv6 addresses..
    property endpoint_ip_address_type : EndpointIpAddressType | Nil

    # The IP address type for traffic within the Client VPN tunnel. Valid values are `ipv4` (default)
    # for IPv4 traffic only, `ipv6` for IPv6 addressing only, or `dual-stack` for both IPv4 and IPv6
    # traffic. When set to `dual-stack`, clients can access both IPv4 and IPv6 resources through the
    # VPN .
    property traffic_ip_address_type : TrafficIpAddressType | Nil

    # The Transit Gateway configuration for the Client VPN endpoint. Use this parameter to associate
    # the endpoint with a Transit Gateway instead of a VPC. You cannot specify both
    # `TransitGatewayConfiguration` and `VpcId`/`SecurityGroupIds`.
    property transit_gateway_configuration : TransitGatewayConfigurationInputStructure | Nil

    def initialize(
      @server_certificate_arn : String,
      @authentication_options : Array(ClientVpnAuthenticationRequest),
      @connection_log_options : ConnectionLogOptions,
      @client_cidr_block : String | Nil = nil,
      @dns_servers : Array(String) | Nil = nil,
      @transport_protocol : TransportProtocol | Nil = nil,
      @vpn_port : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @split_tunnel : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @self_service_portal : SelfServicePortal | Nil = nil,
      @client_connect_options : ClientConnectOptions | Nil = nil,
      @session_timeout_hours : Int32 | Nil = nil,
      @client_login_banner_options : ClientLoginBannerOptions | Nil = nil,
      @client_route_enforcement_options : ClientRouteEnforcementOptions | Nil = nil,
      @disconnect_on_session_timeout : Bool | Nil = nil,
      @endpoint_ip_address_type : EndpointIpAddressType | Nil = nil,
      @traffic_ip_address_type : TrafficIpAddressType | Nil = nil,
      @transit_gateway_configuration : TransitGatewayConfigurationInputStructure | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_cidr_block
        params << {"#{prefix}ClientCidrBlock", value}
      end

      params << {"#{prefix}ServerCertificateArn", @server_certificate_arn}

      @authentication_options.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Authentication.#{i}."))
      end

      params.concat(@connection_log_options.to_query_params("#{prefix}ConnectionLogOptions."))

      (@dns_servers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DnsServers.#{i}", item}
      end

      if value = @transport_protocol
        params << {"#{prefix}TransportProtocol", value.to_json_object_key}
      end

      if value = @vpn_port
        params << {"#{prefix}VpnPort", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @split_tunnel
        params << {"#{prefix}SplitTunnel", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @self_service_portal
        params << {"#{prefix}SelfServicePortal", value.to_json_object_key}
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
        client_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientCidrBlock']")),
        server_certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateArn']")).not_nil!,
        authentication_options: node.xpath_nodes("*[local-name()='Authentication']/*[local-name()='item']").map { |n| ClientVpnAuthenticationRequest.from_xml(n) },
        connection_log_options: node.xpath_node("*[local-name()='ConnectionLogOptions']").try { |n| ConnectionLogOptions.from_xml(n) }.not_nil!,
        dns_servers: node.xpath_nodes("*[local-name()='DnsServers']/*[local-name()='item']").map { |n| n.content },
        transport_protocol: (n = node.xpath_node("*[local-name()='TransportProtocol']")) ? AEC::TransportProtocol.from_json_object_key?(n.content) : nil,
        vpn_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='VpnPort']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        split_tunnel: Core::XMLValue.bool(node.xpath_node("*[local-name()='SplitTunnel']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        self_service_portal: (n = node.xpath_node("*[local-name()='SelfServicePortal']")) ? AEC::SelfServicePortal.from_json_object_key?(n.content) : nil,
        client_connect_options: node.xpath_node("*[local-name()='ClientConnectOptions']").try { |n| ClientConnectOptions.from_xml(n) },
        session_timeout_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTimeoutHours']")),
        client_login_banner_options: node.xpath_node("*[local-name()='ClientLoginBannerOptions']").try { |n| ClientLoginBannerOptions.from_xml(n) },
        client_route_enforcement_options: node.xpath_node("*[local-name()='ClientRouteEnforcementOptions']").try { |n| ClientRouteEnforcementOptions.from_xml(n) },
        disconnect_on_session_timeout: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisconnectOnSessionTimeout']")),
        endpoint_ip_address_type: (n = node.xpath_node("*[local-name()='EndpointIpAddressType']")) ? AEC::EndpointIpAddressType.from_json_object_key?(n.content) : nil,
        traffic_ip_address_type: (n = node.xpath_node("*[local-name()='TrafficIpAddressType']")) ? AEC::TrafficIpAddressType.from_json_object_key?(n.content) : nil,
        transit_gateway_configuration: node.xpath_node("*[local-name()='TransitGatewayConfiguration']").try { |n| TransitGatewayConfigurationInputStructure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @authentication_options
        value.each(&.validate!)
      end

      if value = @connection_log_options
        value.validate!
      end

      if value = @tag_specifications
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

    def_equals_and_hash(@client_cidr_block, @server_certificate_arn, @authentication_options, @connection_log_options, @dns_servers, @transport_protocol, @vpn_port, @description, @split_tunnel, @dry_run, @client_token, @tag_specifications, @security_group_ids, @vpc_id, @self_service_portal, @client_connect_options, @session_timeout_hours, @client_login_banner_options, @client_route_enforcement_options, @disconnect_on_session_timeout, @endpoint_ip_address_type, @traffic_ip_address_type, @transit_gateway_configuration)
  end
end
