private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPolicyOrganizationTargetsResult
    # The IDs of the Amazon Web Services Organizations targets.
    #
    # A target can be an individual Amazon Web Services account or an entity within an Amazon Web
    # Services Organization to which an IPAM policy can be applied.
    property organization_targets : Array(IpamPolicyOrganizationTarget) | Nil

    # The token to use to retrieve the next page of results.
    property next_token : String | Nil

    def initialize(
      @organization_targets : Array(IpamPolicyOrganizationTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@organization_targets || [] of IpamPolicyOrganizationTarget).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OrganizationTargetSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organization_targets: node.xpath_nodes("*[local-name()='organizationTargetSet']/*[local-name()='item']").map { |n| IpamPolicyOrganizationTarget.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @organization_targets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@organization_targets, @next_token)
  end
end
