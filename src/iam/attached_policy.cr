private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about an attached policy.
  #
  # An attached policy is a managed policy that has been attached to a user, group, or role. This
  # data type is used as a response element in the
  # [ListAttachedGroupPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedGroupPolicies.html),
  # [ListAttachedRolePolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedRolePolicies.html),
  # [ListAttachedUserPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedUserPolicies.html),
  # and
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operations.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class AttachedPolicy
    # The friendly name of the attached policy.
    property policy_name : String | Nil

    property policy_arn : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_name
        params << {"#{prefix}PolicyName", value}
      end

      if value = @policy_arn
        params << {"#{prefix}PolicyArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")),
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")),
      )
    end

    def validate! : Nil
      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @policy_arn
        raise Core::ValidationError.new("PolicyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicyArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@policy_name, @policy_arn)
  end
end
