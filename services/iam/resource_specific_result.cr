private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the result of the simulation of a single API operation call on a single resource.
  #
  # This data type is used by a member of the
  # [EvaluationResult](https://docs.aws.amazon.com/IAM/latest/APIReference/API_EvaluationResult.html)
  # data type.
  class ResourceSpecificResult
    # The name of the simulated resource, in Amazon Resource Name (ARN) format.
    property eval_resource_name : String

    # The result of the simulation of the simulated API operation on the resource specified in
    # `EvalResourceName`.
    property eval_resource_decision : PolicyEvaluationDecisionType

    # A list of the statements in the input policies that determine the result for this part of the
    # simulation. Remember that even if multiple statements allow the operation on the resource, if
    # *any* statement denies that operation, then the explicit deny overrides any allow. In addition,
    # the deny statement is the only entry included in the result.
    property matched_statements : Array(Statement) | Nil

    # A list of context keys that are required by the included input policies but that were not
    # provided by one of the input parameters. This list is used when a list of ARNs is included in
    # the `ResourceArns` parameter instead of "*". If you do not specify individual resources, by
    # setting `ResourceArns` to "*" or by not including the `ResourceArns` parameter, then any missing
    # context values are instead included under the `EvaluationResults` section. To discover the
    # context keys used by a set of policies, you can call
    # [GetContextKeysForCustomPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html)
    # or
    # [GetContextKeysForPrincipalPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html).
    property missing_context_values : Array(String) | Nil

    # Additional details about the results of the evaluation decision on a single resource. This
    # parameter is returned only for cross-account simulations. This parameter explains how each
    # policy type contributes to the resource-specific evaluation decision.
    property eval_decision_details : Hash(String, PolicyEvaluationDecisionType) | Nil

    # Contains information about the effect that a permissions boundary has on a policy simulation
    # when that boundary is applied to an IAM entity.
    property permissions_boundary_decision_detail : PermissionsBoundaryDecisionDetail | Nil

    def initialize(
      @eval_resource_name : String,
      @eval_resource_decision : PolicyEvaluationDecisionType,
      @matched_statements : Array(Statement) | Nil = nil,
      @missing_context_values : Array(String) | Nil = nil,
      @eval_decision_details : Hash(String, PolicyEvaluationDecisionType) | Nil = nil,
      @permissions_boundary_decision_detail : PermissionsBoundaryDecisionDetail | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EvalResourceName", @eval_resource_name}

      params << {"#{prefix}EvalResourceDecision", @eval_resource_decision.to_json_object_key}

      (@matched_statements || [] of Statement).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MatchedStatements.member.#{i}."))
      end

      (@missing_context_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MissingContextValues.member.#{i}", item}
      end

      (@eval_decision_details || {} of String => PolicyEvaluationDecisionType).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}EvalDecisionDetails.entry.#{i}.key", key}
        params << {"#{prefix}EvalDecisionDetails.entry.#{i}.value", value.to_json_object_key}
      end

      if value = @permissions_boundary_decision_detail
        params.concat(value.to_query_params("#{prefix}PermissionsBoundaryDecisionDetail."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        eval_resource_name: Core::XMLValue.string(node.xpath_node("*[local-name()='EvalResourceName']")).not_nil!,
        eval_resource_decision: ((n = node.xpath_node("*[local-name()='EvalResourceDecision']")) ? AI::PolicyEvaluationDecisionType.from_json_object_key?(n.content) : nil).not_nil!,
        matched_statements: node.xpath_nodes("*[local-name()='MatchedStatements']/*[local-name()='member']").map { |n| Statement.from_xml(n) },
        missing_context_values: node.xpath_nodes("*[local-name()='MissingContextValues']/*[local-name()='member']").map { |n| n.content },
        eval_decision_details: node.xpath_nodes("*[local-name()='EvalDecisionDetails']/*[local-name()='entry']").each_with_object({} of String => PolicyEvaluationDecisionType) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = AI::PolicyEvaluationDecisionType.from_json_object_key?(entry.xpath_node("*[local-name()='value']").not_nil!.content).not_nil! },
        permissions_boundary_decision_detail: node.xpath_node("*[local-name()='PermissionsBoundaryDecisionDetail']").try { |n| PermissionsBoundaryDecisionDetail.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @eval_resource_name
        raise Core::ValidationError.new("EvalResourceName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EvalResourceName length must be <= 2048") if value.size > 2048
      end

      if value = @matched_statements
        value.each(&.validate!)
      end

      if value = @permissions_boundary_decision_detail
        value.validate!
      end
    end

    def_equals_and_hash(@eval_resource_name, @eval_resource_decision, @matched_statements, @missing_context_values, @eval_decision_details, @permissions_boundary_decision_detail)
  end
end
