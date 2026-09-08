private alias Core = Amazonite::Core

module Amazonite::EC2
  class RevokeClientVpnIngressRequest
    # The ID of the Client VPN endpoint with which the authorization rule is associated.
    property client_vpn_endpoint_id : String

    # The IPv4 address range, in CIDR notation, of the network for which access is being removed.
    property target_network_cidr : String

    # The ID of the Active Directory group for which to revoke access.
    property access_group_id : String | Nil

    # Indicates whether access should be revoked for all groups for a single `TargetNetworkCidr` that
    # earlier authorized ingress for all groups using `AuthorizeAllGroups`. This does not impact other
    # authorization rules that allowed ingress to the same `TargetNetworkCidr` with a specific
    # `AccessGroupId`.
    property revoke_all_groups : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @target_network_cidr : String,
      @access_group_id : String | Nil = nil,
      @revoke_all_groups : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      params << {"#{prefix}TargetNetworkCidr", @target_network_cidr}

      if value = @access_group_id
        params << {"#{prefix}AccessGroupId", value}
      end

      if value = @revoke_all_groups
        params << {"#{prefix}RevokeAllGroups", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        target_network_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetNetworkCidr']")).not_nil!,
        access_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessGroupId']")),
        revoke_all_groups: Core::XMLValue.bool(node.xpath_node("*[local-name()='RevokeAllGroups']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @target_network_cidr, @access_group_id, @revoke_all_groups, @dry_run)
  end
end
