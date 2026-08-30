module Amazonite::CloudFormationV1
  # The output for a DescribeStackResources action.
  class DescribeStackResourcesOutput
    # A list of `StackResource` structures.
    property stack_resources : Array(StackResource) | Nil

    def initialize(
      @stack_resources : Array(StackResource) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@stack_resources || [] of StackResource).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackResources.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resources: node.xpath_nodes("*[local-name()='StackResources']/*[local-name()='member']").map { |n| StackResource.from_xml(n) },
      )
    end

    def_equals_and_hash(@stack_resources)
  end
end
