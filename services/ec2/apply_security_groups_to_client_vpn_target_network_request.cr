private alias Core = Amazonite::Core

module Amazonite::EC2
  class ApplySecurityGroupsToClientVpnTargetNetworkRequest
    # The ID of the Client VPN endpoint.
    property client_vpn_endpoint_id : String

    # The ID of the VPC in which the associated target network is located.
    property vpc_id : String

    # The IDs of the security groups to apply to the associated target network. Up to 5 security
    # groups can be applied to an associated target network.
    property security_group_ids : Array(String) = [] of String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_vpn_endpoint_id : String,
      @vpc_id : String,
      @security_group_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ClientVpnEndpointId", @client_vpn_endpoint_id}

      params << {"#{prefix}VpcId", @vpc_id}

      @security_group_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_vpn_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientVpnEndpointId']")).not_nil!,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")).not_nil!,
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_vpn_endpoint_id, @vpc_id, @security_group_ids, @dry_run)
  end
end
