private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The summary of a stack refactor operation.
  class StackRefactorSummary
    # The ID associated with the stack refactor created from the CreateStackRefactor action.
    property stack_refactor_id : String | Nil

    # A description to help you identify the refactor.
    property description : String | Nil

    # The operation status that's provided after calling the ExecuteStackRefactor action.
    property execution_status : StackRefactorExecutionStatus | Nil

    # A detailed explanation for the stack refactor `ExecutionStatus`.
    property execution_status_reason : String | Nil

    # The stack refactor operation status that's provided after calling the CreateStackRefactor
    # action.
    property status : StackRefactorStatus | Nil

    # A detailed explanation for the stack refactor `Status`.
    property status_reason : String | Nil

    def initialize(
      @stack_refactor_id : String | Nil = nil,
      @description : String | Nil = nil,
      @execution_status : StackRefactorExecutionStatus | Nil = nil,
      @execution_status_reason : String | Nil = nil,
      @status : StackRefactorStatus | Nil = nil,
      @status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_refactor_id
        params << {"#{prefix}StackRefactorId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
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
        stack_refactor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackRefactorId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        execution_status: (n = node.xpath_node("*[local-name()='ExecutionStatus']")) ? ACF::StackRefactorExecutionStatus.from_json_object_key?(n.content) : nil,
        execution_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionStatusReason']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackRefactorStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
      )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@stack_refactor_id, @description, @execution_status, @execution_status_reason, @status, @status_reason)
  end
end
