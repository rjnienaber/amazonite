private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a role that a managed policy is attached to.
  #
  # This data type is used as a response element in the
  # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html)
  # operation.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class PolicyRole
    # The name (friendly name, not ARN) identifying the role.
    property role_name : String | Nil

    # The stable and unique string identifying the role. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the
    # *IAM User Guide*.
    property role_id : String | Nil

    def initialize(
      @role_name : String | Nil = nil,
      @role_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      if value = @role_id
        params << {"#{prefix}RoleId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")),
      )
    end

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @role_id
        raise Core::ValidationError.new("RoleId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("RoleId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RoleId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@role_name, @role_id)
  end
end
