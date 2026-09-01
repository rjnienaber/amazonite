private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DetectStackResourceDriftInput
    # The name of the stack to which the resource belongs.
    property stack_name : String

    # The logical name of the resource for which to return drift information.
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
      if value = @stack_name
        raise Core::ValidationError.new("StackName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StackName does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z][-a-zA-Z0-9]*)|(arn:\\b(aws|aws-us-gov|aws-cn)\\b:[-a-zA-Z0-9:/._+]*)$"))
      end
    end

    def_equals_and_hash(@stack_name, @logical_resource_id)
  end
end
