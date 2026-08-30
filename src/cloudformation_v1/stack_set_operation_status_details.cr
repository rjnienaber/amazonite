private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Detailed information about the StackSet operation.
  class StackSetOperationStatusDetails
    # The number of stack instances for which the StackSet operation failed.
    property failed_stack_instances_count : Int32 | Nil

    def initialize(
      @failed_stack_instances_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @failed_stack_instances_count
        params << {"#{prefix}FailedStackInstancesCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        failed_stack_instances_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='FailedStackInstancesCount']")),
      )
    end

    def validate! : Nil
      if value = @failed_stack_instances_count
        raise Core::ValidationError.new("FailedStackInstancesCount value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@failed_stack_instances_count)
  end
end
