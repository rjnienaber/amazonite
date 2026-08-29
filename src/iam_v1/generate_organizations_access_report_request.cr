private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GenerateOrganizationsAccessReportRequest
    property entity_path : String

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
