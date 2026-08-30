private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for DescribeStackResources action.
  class DescribeStackResourcesInput
    # The name or the unique stack ID that is associated with the stack, which aren't always
    # interchangeable:
    #
    # - Running stacks: You can specify either the stack's name or its unique stack ID.
    #
    # - Deleted stacks: You must specify the unique stack ID.
    #
    # Required: Conditional. If you don't specify `StackName`, you must specify `PhysicalResourceId`.
    property stack_name : String | Nil

    # The logical name of the resource as specified in the template.
    property logical_resource_id : String | Nil

    # The name or unique identifier that corresponds to a physical instance ID of a resource supported
    # by CloudFormation.
    #
    # For example, for an Amazon Elastic Compute Cloud (EC2) instance, `PhysicalResourceId`
    # corresponds to the `InstanceId`. You can pass the EC2 `InstanceId` to `DescribeStackResources`
    # to find which stack the instance belongs to and what other resources are part of the stack.
    #
    # Required: Conditional. If you don't specify `PhysicalResourceId`, you must specify `StackName`.
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
