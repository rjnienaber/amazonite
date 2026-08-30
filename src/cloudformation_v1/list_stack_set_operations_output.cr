private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListStackSetOperationsOutput
    # A list of `StackSetOperationSummary` structures that contain summary information about
    # operations for the specified StackSet.
    property summaries : Array(StackSetOperationSummary) | Nil

    # If the request doesn't return all results, `NextToken` is set to a token. To retrieve the next
    # set of results, call `ListOperationResults` again and assign that token to the request object's
    # `NextToken` parameter. If there are no remaining results, `NextToken` is set to `null`.
    property next_token : String | Nil

    def initialize(
      @summaries : Array(StackSetOperationSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of StackSetOperationSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| StackSetOperationSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@summaries, @next_token)
  end
end
