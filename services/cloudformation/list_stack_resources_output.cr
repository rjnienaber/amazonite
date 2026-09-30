private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The output for a ListStackResources action.
  class ListStackResourcesOutput
    # A list of `StackResourceSummary` structures.
    property stack_resource_summaries : Array(StackResourceSummary) | Nil

    # If the output exceeds 1 MB, a string that identifies the next page of stack resources. If no
    # additional page exists, this value is null.
    property next_token : String | Nil

    def initialize(
      @stack_resource_summaries : Array(StackResourceSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stack_resource_summaries || [] of StackResourceSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackResourceSummaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_summaries: node.xpath_nodes("*[local-name()='StackResourceSummaries']/*[local-name()='member']").map { |n| StackResourceSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @stack_resource_summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stack_resource_summaries, @next_token)
  end
end
