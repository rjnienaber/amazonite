private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for an UpdateStack action.
  class UpdateStackOutput
    # Unique identifier of the stack.
    property stack_id : String | Nil

    # A unique identifier for this update operation that can be used to track the operation's progress
    # and events.
    property operation_id : String | Nil

    def initialize(
      @stack_id : String | Nil = nil,
      @operation_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
      )
    end
  end
end
