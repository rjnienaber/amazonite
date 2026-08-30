private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The location of the resource in a stack template.
  class ResourceLocation
    # The name associated with the stack.
    property stack_name : String

    # The logical name of the resource specified in the template.
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

    def validate! : Nil
    end

    def_equals_and_hash(@stack_name, @logical_resource_id)
  end
end
