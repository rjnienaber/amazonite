private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackRefactorInput
    # The ID associated with the stack refactor created from the CreateStackRefactor action.
    property stack_refactor_id : String

    def initialize(
      @stack_refactor_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackRefactorId", @stack_refactor_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_refactor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackRefactorId']")).not_nil!,
      )
    end
  end
end
