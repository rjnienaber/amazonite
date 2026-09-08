private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableIpamPolicyRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM policy to enable.
    property ipam_policy_id : String

    # A target can be an individual Amazon Web Services account or an entity within an Amazon Web
    # Services Organization to which an IPAM policy can be applied.
    #
    # The ID of the Amazon Web Services Organizations target for which to enable the IPAM policy. This
    # parameter is required only when IPAM is integrated with Amazon Web Services Organizations. When
    # IPAM is not integrated with Amazon Web Services Organizations, omit this parameter and the
    # policy will apply to the current account.
    property organization_target_id : String | Nil

    def initialize(
      @ipam_policy_id : String,
      @dry_run : Bool | Nil = nil,
      @organization_target_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPolicyId", @ipam_policy_id}

      if value = @organization_target_id
        params << {"#{prefix}OrganizationTargetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPolicyId']")).not_nil!,
        organization_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationTargetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_policy_id, @organization_target_id)
  end
end
