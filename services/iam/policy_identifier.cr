private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Identifies one or more policies as a union type. Specify exactly one of `PolicyType`,
  # `PolicyArn`, or `InlinePolicyIdentifier` to identify policies by their type, by Amazon Resource
  # Name (ARN), or by the name of an inline policy and the entity it is attached to.
  class PolicyIdentifier
    # The policy type to identify. All policies of the specified type are matched.
    property policy_type : PolicyIdentifierPolicyType | Nil

    # The Amazon Resource Name (ARN) of an Amazon Web Services managed policy or a customer managed
    # policy that is attached to an IAM user, group, or role. Wildcard characters are supported in the
    # resource name portion of the ARN to match multiple managed policies: use at most one `*`
    # (matches any sequence of characters, including none), and any number of `?` (each matches
    # exactly one character).
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String | Nil

    # An inline policy identifier consisting of a policy name and the entity it is attached to.
    # Wildcard characters (`*` and `?`) in the entity name can match multiple entities.
    property inline_policy_identifier : InlinePolicyIdentifierType | Nil

    def initialize(
      @policy_type : PolicyIdentifierPolicyType | Nil = nil,
      @policy_arn : String | Nil = nil,
      @inline_policy_identifier : InlinePolicyIdentifierType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_type
        params << {"#{prefix}PolicyType", value.to_json_object_key}
      end

      if value = @policy_arn
        params << {"#{prefix}PolicyArn", value}
      end

      if value = @inline_policy_identifier
        params.concat(value.to_query_params("#{prefix}InlinePolicyIdentifier."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_type: (n = node.xpath_node("*[local-name()='PolicyType']")) ? AI::PolicyIdentifierPolicyType.from_json_object_key?(n.content) : nil,
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")),
        inline_policy_identifier: node.xpath_node("*[local-name()='InlinePolicyIdentifier']").try { |n| InlinePolicyIdentifierType.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @policy_arn
        raise Core::ValidationError.new("PolicyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicyArn length must be <= 2048") if value.size > 2048
      end

      if value = @inline_policy_identifier
        value.validate!
      end
    end

    def_equals_and_hash(@policy_type, @policy_arn, @inline_policy_identifier)
  end
end
