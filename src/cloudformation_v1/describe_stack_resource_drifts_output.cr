private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackResourceDriftsOutput
    property stack_resource_drifts : Array(StackResourceDrift) = [] of StackResourceDrift

    property next_token : String | Nil

    def initialize(
      @stack_resource_drifts : Array(StackResourceDrift),
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @stack_resource_drifts.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StackResourceDrifts.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_drifts: node.xpath_nodes("*[local-name()='StackResourceDrifts']/*[local-name()='member']").map { |n| StackResourceDrift.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
