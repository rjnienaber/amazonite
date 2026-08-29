private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackResourcesInput
    property stack_name : String | Nil

    property logical_resource_id : String | Nil

    property physical_resource_id : String | Nil

    def initialize(
      @stack_name : String | Nil = nil,
      @logical_resource_id : String | Nil = nil,
      @physical_resource_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      if value = @physical_resource_id
        params << {"#{prefix}PhysicalResourceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
      )
    end
  end
end
