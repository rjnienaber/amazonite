private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceLocation
    property stack_name : String

    property logical_resource_id : String

    def initialize(
      @stack_name : String,
      @logical_resource_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      params << {"#{prefix}LogicalResourceId", @logical_resource_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")).not_nil!,
      )
    end
  end
end
