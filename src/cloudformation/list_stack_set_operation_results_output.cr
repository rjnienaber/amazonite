private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListStackSetOperationResultsOutput
    # A list of `StackSetOperationResultSummary` structures that contain information about the
    # specified operation results, for accounts and Amazon Web Services Regions that are included in
    # the operation.
    property summaries : Array(StackSetOperationResultSummary) | Nil

    # If the request doesn't return all results, `NextToken` is set to a token. To retrieve the next
    # set of results, call `ListOperationResults` again and assign that token to the request object's
    # `NextToken` parameter. If there are no remaining results, `NextToken` is set to `null`.
    property next_token : String | Nil

    def initialize(
      @summaries : Array(StackSetOperationResultSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of StackSetOperationResultSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| StackSetOperationResultSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@summaries, @next_token)
  end
end
