private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the effect that a permissions boundary has on a policy simulation
  # when the boundary is applied to an IAM entity.
  class PermissionsBoundaryDecisionDetail
    # Specifies whether an action is allowed by a permissions boundary that is applied to an IAM
    # entity (user or role). A value of `true` means that the permissions boundary does not deny the
    # action. This means that the policy includes an `Allow` statement that matches the request. In
    # this case, if an identity-based policy also allows the action, the request is allowed. A value
    # of `false` means that either the requested action is not allowed (implicitly denied) or that the
    # action is explicitly denied by the permissions boundary. In both of these cases, the action is
    # not allowed, regardless of the identity-based policy.
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

    def validate! : Nil
    end

    def_equals_and_hash(@allowed_by_permissions_boundary)
  end
end
