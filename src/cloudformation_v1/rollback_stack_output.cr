private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RollbackStackOutput
    # Unique identifier of the stack.
    property stack_id : String | Nil

    # A unique identifier for this rollback operation that can be used to track the operation's
    # progress and events.
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

    def_equals_and_hash(@stack_id, @operation_id)
  end
end
