private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the DeleteChangeSet action.
  class DeleteChangeSetInput
    # The name or Amazon Resource Name (ARN) of the change set that you want to delete.
    property change_set_name : String

    # If you specified the name of a change set to delete, specify the stack name or Amazon Resource
    # Name (ARN) that's associated with it.
    property stack_name : String | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
      )
    end

    def_equals_and_hash(@change_set_name, @stack_name)
  end
end
