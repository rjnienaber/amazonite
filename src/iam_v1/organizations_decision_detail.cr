private alias Core = Amazonite::Core

module Amazonite::IamV1
  class OrganizationsDecisionDetail
    property allowed_by_organizations : Bool | Nil

    def initialize(
      @allowed_by_organizations : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allowed_by_organizations
        params << {"#{prefix}AllowedByOrganizations", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_by_organizations: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowedByOrganizations']")),
      )
    end
  end
end
