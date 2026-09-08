private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Amazon Web Services Organizations target for an IPAM policy.
  class IpamPolicyOrganizationTarget
    # The ID of the Amazon Web Services Organizations target.
    #
    # A target can be an individual Amazon Web Services account or an entity within an Amazon Web
    # Services Organization to which an IPAM policy can be applied.
    property organization_target_id : String | Nil

    def initialize(
      @organization_target_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organization_target_id
        params << {"#{prefix}OrganizationTargetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organization_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationTargetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@organization_target_id)
  end
end
