private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the ListChangeSets action.
  class ListChangeSetsInput
    # The name or the Amazon Resource Name (ARN) of the stack for which you want to list change sets.
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

    def_equals_and_hash(@stack_name, @next_token)
  end
end
