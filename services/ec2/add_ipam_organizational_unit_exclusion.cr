private alias Core = Amazonite::Core

module Amazonite::EC2
  # Add an Organizational Unit (OU) exclusion to your IPAM. If your IPAM is integrated with Amazon
  # Web Services Organizations and you add an organizational unit (OU) exclusion, IPAM will not
  # manage the IP addresses in accounts in that OU exclusion. There is a limit on the number of
  # exclusions you can create. For more information, see [Quotas for your
  # IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/quotas-ipam.html) in the *Amazon VPC IPAM User
  # Guide*.
  class AddIpamOrganizationalUnitExclusion
    # An Amazon Web Services Organizations entity path. Build the path for the OU(s) using Amazon Web
    # Services Organizations IDs separated by a `/`. Include all child OUs by ending the path with
    # `/*`.
    #
    # - Example 1
    #
    # - Path to a child OU: `o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-ghi0-awsccccc/ou-jkl0-awsddddd/`
    #
    # - In this example, `o-a1b2c3d4e5` is the organization ID, `r-f6g7h8i9j0example` is the root ID ,
    # `ou-ghi0-awsccccc` is an OU ID, and `ou-jkl0-awsddddd` is a child OU ID.
    #
    # - IPAM will not manage the IP addresses in accounts in the child OU.
    #
    # - Example 2
    #
    # - Path where all child OUs will be part of the exclusion:
    # `o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-ghi0-awsccccc/*`
    #
    # - In this example, IPAM will not manage the IP addresses in accounts in the OU
    # (`ou-ghi0-awsccccc`) or in accounts in any OUs that are children of the OU.
    #
    # For more information on how to construct an entity path, see [Understand the Amazon Web Services
    # Organizations entity
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
        organizations_entity_path: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationsEntityPath']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@organizations_entity_path)
  end
end
