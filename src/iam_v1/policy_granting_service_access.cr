private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains details about the permissions policies that are attached to the specified identity
  # (user, group, or role).
  #
  # This data type is an element of the
  # [ListPoliciesGrantingServiceAccessEntry](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccessEntry.html)
  # object.
  class PolicyGrantingServiceAccess
    # The policy name.
    property policy_name : String

    # The policy type. For more information about these policy types, see [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
    # in the *IAM User Guide*.
    property policy_type : PolicyType

    property policy_arn : String | Nil

    # The type of entity (user or role) that used the policy to access the service to which the inline
    # policy is attached.
    #
    # This field is null for managed policies. For more information about these policy types, see
    # [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
    # in the *IAM User Guide*.
    property entity_type : PolicyOwnerEntityType | Nil

    # The name of the entity (user or role) to which the inline policy is attached.
    #
    # This field is null for managed policies. For more information about these policy types, see
    # [Managed policies and inline
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
    # in the *IAM User Guide*.
    property entity_name : String | Nil

    def initialize(
      @policy_name : String,
      @policy_type : PolicyType,
      @policy_arn : String | Nil = nil,
      @entity_type : PolicyOwnerEntityType | Nil = nil,
      @entity_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyName", @policy_name}

      params << {"#{prefix}PolicyType", @policy_type.to_json_object_key}

      if value = @policy_arn
        params << {"#{prefix}PolicyArn", value}
      end

      if value = @entity_type
        params << {"#{prefix}EntityType", value.to_json_object_key}
      end

      if value = @entity_name
        params << {"#{prefix}EntityName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")).not_nil!,
        policy_type: ((n = node.xpath_node("*[local-name()='PolicyType']")) ? AI::PolicyType.from_json_object_key?(n.content) : nil).not_nil!,
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")),
        entity_type: (n = node.xpath_node("*[local-name()='EntityType']")) ? AI::PolicyOwnerEntityType.from_json_object_key?(n.content) : nil,
        entity_name: Core::XMLValue.string(node.xpath_node("*[local-name()='EntityName']")),
      )
    end

    def_equals_and_hash(@policy_name, @policy_type, @policy_arn, @entity_type, @entity_name)
  end
end
