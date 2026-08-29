private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyIdentifier
    property policy_type : PolicyIdentifierPolicyType | Nil

    property policy_arn : String | Nil

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
  end
end
