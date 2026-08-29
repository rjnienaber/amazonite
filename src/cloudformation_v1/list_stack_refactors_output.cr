private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackRefactorsOutput
    property stack_refactor_summaries : Array(StackRefactorSummary) = [] of StackRefactorSummary

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
  end
end
