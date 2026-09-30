private alias Core = Amazonite::Core

module Amazonite::EC2
  class AuthorizeClientVpnIngressRequest
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String

    # The IPv4 address range, in CIDR notation, of the network for which access is being authorized.
    property target_network_cidr : String

    # The ID of the group to grant access to, for example, the Active Directory group or identity
    # provider (IdP) group. Required if `AuthorizeAllGroups` is `false` or not specified.
    property access_group_id : String | Nil

    # Indicates whether to grant access to all clients. Specify `true` to grant all clients who
    # successfully establish a VPN connection access to the network. Must be set to `true` if
    # `AccessGroupId` is not specified.
    property authorize_all_groups : Bool | Nil

    # A brief description of the authorization rule.
    property description : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @target_network_cidr : String,
      @access_group_id : String | Nil = nil,
      @authorize_all_groups : Bool | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
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

      if value = @authorize_all_groups
        params << {"#{prefix}AuthorizeAllGroups", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
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
        authorize_all_groups: Core::XMLValue.bool(node.xpath_node("*[local-name()='AuthorizeAllGroups']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @target_network_cidr, @access_group_id, @authorize_all_groups, @description, @client_token, @dry_run)
  end
end
