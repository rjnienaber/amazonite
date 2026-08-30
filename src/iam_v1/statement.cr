private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains a reference to a `Statement` element in a policy document that determines the result of
  # the simulation.
  #
  # This data type is used by the `MatchedStatements` member of the `
  # [EvaluationResult](https://docs.aws.amazon.com/IAM/latest/APIReference/API_EvaluationResult.html)
  # ` type.
  class Statement
    # The identifier of the policy that was provided as an input.
    property source_policy_id : String | Nil

    # The type of the policy.
    property source_policy_type : PolicySourceType | Nil

    # The row and column of the beginning of the `Statement` in an IAM policy.
    property start_position : Position | Nil

    # The row and column of the end of a `Statement` in an IAM policy.
    property end_position : Position | Nil

    def initialize(
      @source_policy_id : String | Nil = nil,
      @source_policy_type : PolicySourceType | Nil = nil,
      @start_position : Position | Nil = nil,
      @end_position : Position | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_policy_id
        params << {"#{prefix}SourcePolicyId", value}
      end

      if value = @source_policy_type
        params << {"#{prefix}SourcePolicyType", value.to_json_object_key}
      end

      if value = @start_position
        params.concat(value.to_query_params("#{prefix}StartPosition."))
      end

      if value = @end_position
        params.concat(value.to_query_params("#{prefix}EndPosition."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourcePolicyId']")),
        source_policy_type: (n = node.xpath_node("*[local-name()='SourcePolicyType']")) ? AI::PolicySourceType.from_json_object_key?(n.content) : nil,
        start_position: node.xpath_node("*[local-name()='StartPosition']").try { |n| Position.from_xml(n) },
        end_position: node.xpath_node("*[local-name()='EndPosition']").try { |n| Position.from_xml(n) },
      )
    end

    def_equals_and_hash(@source_policy_id, @source_policy_type, @start_position, @end_position)
  end
end
