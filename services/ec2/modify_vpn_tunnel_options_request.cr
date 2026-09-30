private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpnTunnelOptionsRequest
    # The ID of the Amazon Web Services Site-to-Site VPN connection.
    property vpn_connection_id : String

    # The external IP address of the VPN tunnel.
    property vpn_tunnel_outside_ip_address : String

    # The tunnel options to modify.
    property tunnel_options : ModifyVpnTunnelOptionsSpecification

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Choose whether or not to trigger immediate tunnel replacement. This is only applicable when
    # turning on or off `EnableTunnelLifecycleControl`.
    #
    # Valid values: `True` | `False`
    property skip_tunnel_replacement : Bool | Nil

    # Specifies the storage mode for the pre-shared key (PSK). Valid values are `Standard` (stored in
    # Site-to-Site VPN service) or `SecretsManager` (stored in Amazon Web Services Secrets Manager).
    property pre_shared_key_storage : String | Nil

    def initialize(
      @vpn_connection_id : String,
      @vpn_tunnel_outside_ip_address : String,
      @tunnel_options : ModifyVpnTunnelOptionsSpecification,
      @dry_run : Bool | Nil = nil,
      @skip_tunnel_replacement : Bool | Nil = nil,
      @pre_shared_key_storage : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VpnConnectionId", @vpn_connection_id}

      params << {"#{prefix}VpnTunnelOutsideIpAddress", @vpn_tunnel_outside_ip_address}

      params.concat(@tunnel_options.to_query_params("#{prefix}TunnelOptions."))

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @skip_tunnel_replacement
        params << {"#{prefix}SkipTunnelReplacement", Core::QueryValue.bool(value)}
      end

      if value = @pre_shared_key_storage
        params << {"#{prefix}PreSharedKeyStorage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpn_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnConnectionId']")).not_nil!,
        vpn_tunnel_outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='VpnTunnelOutsideIpAddress']")).not_nil!,
        tunnel_options: node.xpath_node("*[local-name()='TunnelOptions']").try { |n| ModifyVpnTunnelOptionsSpecification.from_xml(n) }.not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        skip_tunnel_replacement: Core::XMLValue.bool(node.xpath_node("*[local-name()='SkipTunnelReplacement']")),
        pre_shared_key_storage: Core::XMLValue.string(node.xpath_node("*[local-name()='PreSharedKeyStorage']")),
      )
    end

    def validate! : Nil
      if value = @tunnel_options
        value.validate!
      end
    end

    def_equals_and_hash(@vpn_connection_id, @vpn_tunnel_outside_ip_address, @tunnel_options, @dry_run, @skip_tunnel_replacement, @pre_shared_key_storage)
  end
end
