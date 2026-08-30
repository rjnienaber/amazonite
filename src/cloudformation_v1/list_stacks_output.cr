private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for ListStacks action.
  class ListStacksOutput
    # A list of `StackSummary` structures that contains information about the specified stacks.
    property stack_summaries : Array(StackSummary) | Nil

    # If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no
    # additional page exists, this value is null.
    property next_token : String | Nil

    def initialize(
      @stack_summaries : Array(StackSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stack_summaries || [] of StackSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_summaries: node.xpath_nodes("*[local-name()='StackSummaries']/*[local-name()='member']").map { |n| StackSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@stack_summaries, @next_token)
  end
end
