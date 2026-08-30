private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PutRolePermissionsBoundaryRequest
    # The name (friendly name, not ARN) of the IAM role for which you want to set the permissions
    # boundary.
    property role_name : String

    # The ARN of the managed policy that is used to set the permissions boundary for the role.
    #
    # A permissions boundary policy defines the maximum permissions that identity-based policies can
    # grant to an entity, but does not grant permissions. Permissions boundaries do not define the
    # maximum permissions that a resource-based policy can grant to an entity. To learn more, see
    # [Permissions boundaries for IAM
    # entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) in
    # the *IAM User Guide*.
    #
    # For more information about policy types, see [Policy types
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types) in
    # the *IAM User Guide*.
    property permissions_boundary : String

    def initialize(
      @role_name : String,
      @permissions_boundary : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}PermissionsBoundary", @permissions_boundary}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")).not_nil!,
      )
    end

    def_equals_and_hash(@role_name, @permissions_boundary)
  end
end
