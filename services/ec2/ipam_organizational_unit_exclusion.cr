private alias Core = Amazonite::Core

module Amazonite::EC2
  # If your IPAM is integrated with Amazon Web Services Organizations and you add an organizational
  # unit (OU) exclusion, IPAM will not manage the IP addresses in accounts in that OU exclusion.
  class IpamOrganizationalUnitExclusion
    # An Amazon Web Services Organizations entity path. For more information on the entity path, see
    # [Understand the Amazon Web Services Organizations entity
    # path](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_last-accessed-view-data-orgs.html#access_policies_access-advisor-viewing-orgs-entity-path)
    # in the *Amazon Web Services Identity and Access Management User Guide*.
    property organizations_entity_path : String | Nil

    def initialize(
      @organizations_entity_path : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organizations_entity_path
        params << {"#{prefix}OrganizationsEntityPath", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organizations_entity_path: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationsEntityPath']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@organizations_entity_path)
  end
end
