private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DetectStackDriftInput
    property stack_name : String

    property logical_resource_ids : Array(String) | Nil

    def initialize(
      @stack_name : String,
      @logical_resource_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      (@logical_resource_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}LogicalResourceIds.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        logical_resource_ids: node.xpath_nodes("*[local-name()='LogicalResourceIds']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
