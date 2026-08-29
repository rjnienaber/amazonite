private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PermissionsBoundaryDecisionDetail
    property allowed_by_permissions_boundary : Bool | Nil

    def initialize(
      @allowed_by_permissions_boundary : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allowed_by_permissions_boundary
        params << {"#{prefix}AllowedByPermissionsBoundary", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_by_permissions_boundary: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowedByPermissionsBoundary']")),
      )
    end
  end
end
