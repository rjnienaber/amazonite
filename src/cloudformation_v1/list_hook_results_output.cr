private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListHookResultsOutput
    # The target type.
    property target_type : ListHookResultsTargetType | Nil

    # The unique identifier of the Hook invocation target.
    property target_id : String | Nil

    # A list of `HookResultSummary` structures that provides the status and Hook status reason for
    # each Hook invocation for the specified target.
    property hook_results : Array(HookResultSummary) | Nil

    # Pagination token, `null` or empty if no more results.
    property next_token : String | Nil

    def initialize(
      @target_type : ListHookResultsTargetType | Nil = nil,
      @target_id : String | Nil = nil,
      @hook_results : Array(HookResultSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @target_type
        params << {"#{prefix}TargetType", value.to_json_object_key}
      end

      if value = @target_id
        params << {"#{prefix}TargetId", value}
      end

      (@hook_results || [] of HookResultSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HookResults.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_type: (n = node.xpath_node("*[local-name()='TargetType']")) ? ACF::ListHookResultsTargetType.from_json_object_key?(n.content) : nil,
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetId']")),
        hook_results: node.xpath_nodes("*[local-name()='HookResults']/*[local-name()='member']").map { |n| HookResultSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@target_type, @target_id, @hook_results, @next_token)
  end
end
