private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyClientVpnEndpointRequest
    # The ID of the Client VPN endpoint to modify.
    property client_vpn_endpoint_id : String

    # The ARN of the server certificate to be used. The server certificate must be provisioned in
    # Certificate Manager (ACM).
    property server_certificate_arn : String | Nil

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
    property connection_log_options : ConnectionLogOptions | Nil

    # Information about the DNS servers to be used by Client VPN connections. A Client VPN endpoint
    # can have up to two DNS servers.
    property dns_servers : DnsServersOptionsModifyStructure | Nil

    # The port number to assign to the Client VPN endpoint for TCP and UDP traffic.
    #
    # Valid Values: `443` | `1194`
    #
    # Default Value: `443`
    property vpn_port : Int32 | Nil

    # A brief description of the Client VPN endpoint.
    property description : String | Nil

    # Indicates whether the VPN is split-tunnel.
    #
    # For information about split-tunnel VPN endpoints, see [Split-tunnel Client VPN
    # endpoint](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/split-tunnel-vpn.html) in the
    # *Client VPN Administrator Guide*.
    property split_tunnel : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of one or more security groups to apply to the target network.
    property security_group_ids : Array(String) | Nil

    # The ID of the VPC to associate with the Client VPN endpoint.
    property vpc_id : String | Nil

    # Specify whether to enable the self-service portal for the Client VPN endpoint.
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
    # `sessionTimeoutHours` is reached. If `true`, users are prompted to reconnect client VPN. If
    # `false`, client VPN attempts to reconnect automatically. The default value is `true`.
    property disconnect_on_session_timeout : Bool | Nil

    # The Transit Gateway configuration for the Client VPN endpoint. This option is currently not
    # supported.
    property transit_gateway_configuration : TransitGatewayConfigurationInputStructure | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @server_certificate_arn : String | Nil = nil,
      @connection_log_options : ConnectionLogOptions | Nil = nil,
      @dns_servers : DnsServersOptionsModifyStructure | Nil = nil,
      @vpn_port : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @split_tunnel : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @self_service_portal : SelfServicePortal | Nil = nil,
      @client_connect_options : ClientConnectOptions | Nil = nil,
      @session_timeout_hours : Int32 | Nil = nil,
      @client_login_banner_options : ClientLoginBannerOptions | Nil = nil,
      @client_route_enforcement_options : ClientRouteEnforcementOptions | Nil = nil,
      @disconnect_on_session_timeout : Bool | Nil = nil,
      @transit_gateway_configuration : TransitGatewayConfigurationInputStructure | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      if value = @server_certificate_arn
        params << {"#{prefix}ServerCertificateArn", value}
      end

      if value = @connection_log_options
        params.concat(value.to_query_params("#{prefix}ConnectionLogOptions."))
      end

      if value = @dns_servers
        params.concat(value.to_query_params("#{prefix}DnsServers."))
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

      if value = @transit_gateway_configuration
        params.concat(value.to_query_params("#{prefix}TransitGatewayConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        server_certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateArn']")),
        connection_log_options: node.xpath_node("*[local-name()='ConnectionLogOptions']").try { |n| ConnectionLogOptions.from_xml(n) },
        dns_servers: node.xpath_node("*[local-name()='DnsServers']").try { |n| DnsServersOptionsModifyStructure.from_xml(n) },
        vpn_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='VpnPort']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        split_tunnel: Core::XMLValue.bool(node.xpath_node("*[local-name()='SplitTunnel']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        self_service_portal: (n = node.xpath_node("*[local-name()='SelfServicePortal']")) ? AEC::SelfServicePortal.from_json_object_key?(n.content) : nil,
        client_connect_options: node.xpath_node("*[local-name()='ClientConnectOptions']").try { |n| ClientConnectOptions.from_xml(n) },
        session_timeout_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionTimeoutHours']")),
        client_login_banner_options: node.xpath_node("*[local-name()='ClientLoginBannerOptions']").try { |n| ClientLoginBannerOptions.from_xml(n) },
        client_route_enforcement_options: node.xpath_node("*[local-name()='ClientRouteEnforcementOptions']").try { |n| ClientRouteEnforcementOptions.from_xml(n) },
        disconnect_on_session_timeout: Core::XMLValue.bool(node.xpath_node("*[local-name()='DisconnectOnSessionTimeout']")),
        transit_gateway_configuration: node.xpath_node("*[local-name()='TransitGatewayConfiguration']").try { |n| TransitGatewayConfigurationInputStructure.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @connection_log_options
        value.validate!
      end

      if value = @dns_servers
        value.validate!
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

    def_equals_and_hash(@client_vpn_endpoint_id, @server_certificate_arn, @connection_log_options, @dns_servers, @vpn_port, @description, @split_tunnel, @dry_run, @security_group_ids, @vpc_id, @self_service_portal, @client_connect_options, @session_timeout_hours, @client_login_banner_options, @client_route_enforcement_options, @disconnect_on_session_timeout, @transit_gateway_configuration)
  end
end
