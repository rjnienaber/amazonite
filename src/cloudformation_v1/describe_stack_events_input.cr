private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for DescribeStackEvents action.
  class DescribeStackEventsInput
    # The name or the unique stack ID that's associated with the stack, which aren't always
    # interchangeable:
    #
    # - Running stacks: You can specify either the stack's name or its unique stack ID.
    #
    # - Deleted stacks: You must specify the unique stack ID.
    property stack_name : String

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    def initialize(
      @stack_name : String,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackName", @stack_name}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
