private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about the effect that Organizations has on a policy simulation.
  class OrganizationsDecisionDetail
    # Specifies whether the simulated operation is allowed by the Organizations service control
    # policies that impact the simulated user's account.
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

    def validate! : Nil
    end

    def_equals_and_hash(@allowed_by_organizations)
  end
end
