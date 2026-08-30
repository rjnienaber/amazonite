private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackRefactorsOutput
    # Provides a summary of a stack refactor, including the following:
    #
    # - `StackRefactorId`
    #
    # - `Status`
    #
    # - `StatusReason`
    #
    # - `ExecutionStatus`
    #
    # - `ExecutionStatusReason`
    #
    # - `Description`
    property stack_refactor_summaries : Array(StackRefactorSummary) = [] of StackRefactorSummary

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call this action again and assign that token to the request
    # object's `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # `null`.
    property next_token : String | Nil

    def initialize(
      @stack_refactor_summaries : Array(StackRefactorSummary),
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @stack_refactor_summaries.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackRefactorSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_refactor_summaries: node.xpath_nodes("*[local-name()='StackRefactorSummaries']/*[local-name()='member']").map { |n| StackRefactorSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@stack_refactor_summaries, @next_token)
  end
end
