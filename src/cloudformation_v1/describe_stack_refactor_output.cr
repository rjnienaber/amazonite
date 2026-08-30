private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeStackRefactorOutput
    # A description to help you identify the refactor.
    property description : String | Nil

    # The ID associated with the stack refactor created from the CreateStackRefactor action.
    property stack_refactor_id : String | Nil

    # The unique ID for each stack.
    property stack_ids : Array(String) | Nil

    # The stack refactor execution operation status that's provided after calling the
    # ExecuteStackRefactor action.
    property execution_status : StackRefactorExecutionStatus | Nil

    # A detailed explanation for the stack refactor `ExecutionStatus`.
    property execution_status_reason : String | Nil

    # The stack refactor operation status that's provided after calling the CreateStackRefactor
    # action.
    property status : StackRefactorStatus | Nil

    # A detailed explanation for the stack refactor operation `Status`.
    property status_reason : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @stack_refactor_id : String | Nil = nil,
      @stack_ids : Array(String) | Nil = nil,
      @execution_status : StackRefactorExecutionStatus | Nil = nil,
      @execution_status_reason : String | Nil = nil,
      @status : StackRefactorStatus | Nil = nil,
      @status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @stack_refactor_id
        params << {"#{prefix}StackRefactorId", value}
      end

      (@stack_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}StackIds.member.#{i}", item}
      end

      if value = @execution_status
        params << {"#{prefix}ExecutionStatus", value.to_json_object_key}
      end

      if value = @execution_status_reason
        params << {"#{prefix}ExecutionStatusReason", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        stack_refactor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackRefactorId']")),
        stack_ids: node.xpath_nodes("*[local-name()='StackIds']/*[local-name()='member']").map { |n| n.content },
        execution_status: (n = node.xpath_node("*[local-name()='ExecutionStatus']")) ? ACF::StackRefactorExecutionStatus.from_json_object_key?(n.content) : nil,
        execution_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionStatusReason']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackRefactorStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
      )
    end
  end
end
