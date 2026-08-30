private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an attached permissions boundary.
  #
  # An attached permissions boundary is a managed policy that has been attached to a user or role to
  # set the permissions boundary.
  #
  # For more information about permissions boundaries, see [Permissions boundaries for IAM
  # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  # in the *IAM User Guide*.
  class AttachedPermissionsBoundary
    # The permissions boundary usage type that indicates what type of IAM resource is used as the
    # permissions boundary for an entity. This data type can only have a value of `Policy`.
    property permissions_boundary_type : PermissionsBoundaryAttachmentType | Nil

    # The ARN of the policy used to set the permissions boundary for the user or role.
    property permissions_boundary_arn : String | Nil

    def initialize(
      @permissions_boundary_type : PermissionsBoundaryAttachmentType | Nil = nil,
      @permissions_boundary_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @permissions_boundary_type
        params << {"#{prefix}PermissionsBoundaryType", value.to_json_object_key}
      end

      if value = @permissions_boundary_arn
        params << {"#{prefix}PermissionsBoundaryArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        permissions_boundary_type: (n = node.xpath_node("*[local-name()='PermissionsBoundaryType']")) ? AI::PermissionsBoundaryAttachmentType.from_json_object_key?(n.content) : nil,
        permissions_boundary_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundaryArn']")),
      )
    end
  end
end
