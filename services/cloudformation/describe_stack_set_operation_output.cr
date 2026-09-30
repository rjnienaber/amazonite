private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class DescribeStackSetOperationOutput
    # The specified StackSet operation.
    property stack_set_operation : StackSetOperation | Nil

    def initialize(
      @stack_set_operation : StackSetOperation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_operation
        params.concat(value.to_query_params("#{prefix}StackSetOperation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_operation: node.xpath_node("*[local-name()='StackSetOperation']").try { |n| StackSetOperation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @stack_set_operation
        value.validate!
      end
    end

    def_equals_and_hash(@stack_set_operation)
  end
end
