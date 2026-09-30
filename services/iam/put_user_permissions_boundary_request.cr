private alias Core = Amazonite::Core

module Amazonite::Iam
  class PutUserPermissionsBoundaryRequest
    # The name (friendly name, not ARN) of the IAM user for which you want to set the permissions
    # boundary.
    property user_name : String

    # The ARN of the managed policy that is used to set the permissions boundary for the user.
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
      @user_name : String,
      @permissions_boundary : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}PermissionsBoundary", @permissions_boundary}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @permissions_boundary
        raise Core::ValidationError.new("PermissionsBoundary length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PermissionsBoundary length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@user_name, @permissions_boundary)
  end
end
