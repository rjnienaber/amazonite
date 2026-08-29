private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GenerateOrganizationsAccessReportRequest
    # The path of the Organizations entity (root, OU, or account). You can build an entity path using
    # the known structure of your organization. For example, assume that your account ID is
    # `123456789012` and its parent OU ID is `ou-rge0-awsabcde`. The organization root ID is
    # `r-f6g7h8i9j0example` and your organization ID is `o-a1b2c3d4e5`. Your entity path is
    # `o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012`.
    property entity_path : String

    # The identifier of the Organizations service control policy (SCP). This parameter is optional.
    #
    # This ID is used to generate information about when an account principal that is limited by the
    # SCP attempted to access an Amazon Web Services service.
    property organizations_policy_id : String | Nil

    def initialize(
      @entity_path : String,
      @organizations_policy_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EntityPath", @entity_path}

      if value = @organizations_policy_id
        params << {"#{prefix}OrganizationsPolicyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        entity_path: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityPath']")).not_nil!,
        organizations_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationsPolicyId']")),
      )
    end
  end
end
