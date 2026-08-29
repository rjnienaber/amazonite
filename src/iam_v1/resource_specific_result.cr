private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ResourceSpecificResult
    property eval_resource_name : String

    property eval_resource_decision : PolicyEvaluationDecisionType

    property matched_statements : Array(Statement) | Nil

    property missing_context_values : Array(String) | Nil

    property eval_decision_details : Hash(String, PolicyEvaluationDecisionType) | Nil

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
  end
end
