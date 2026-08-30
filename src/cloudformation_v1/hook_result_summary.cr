private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A `ListHookResults` call returns a summary of a Hook invocation.
  class HookResultSummary
    # The unique identifier for this Hook invocation result.
    property hook_result_id : String | Nil

    # The specific point in the provisioning process where the Hook is invoked.
    property invocation_point : HookInvocationPoint | Nil

    # The failure mode of the invocation.
    property failure_mode : HookFailureMode | Nil

    # The name of the Hook that was invoked.
    property type_name : String | Nil

    # The version of the Hook that was invoked.
    property type_version_id : String | Nil

    # The version of the Hook configuration.
    property type_configuration_version_id : String | Nil

    # The status of the Hook invocation. The following statuses are possible:
    #
    # - `HOOK_IN_PROGRESS`: The Hook is currently running.
    #
    # - `HOOK_COMPLETE_SUCCEEDED`: The Hook completed successfully.
    #
    # - `HOOK_COMPLETE_FAILED`: The Hook completed but failed validation.
    #
    # - `HOOK_FAILED`: The Hook encountered an error during execution.
    property status : HookStatus | Nil

    # A description of the Hook results status. For example, if the Hook result is in a failed state,
    # this may contain additional information for the failed state.
    property hook_status_reason : String | Nil

    # The timestamp when the Hook was invoked.
    #
    # Only shown in responses when the request does not specify `TargetType` and `TargetId` filters.
    property invoked_at : Time | Nil

    # The target type that the Hook was invoked against.
    property target_type : ListHookResultsTargetType | Nil

    # The unique identifier of the Hook invocation target.
    property target_id : String | Nil

    # The ARN of the Hook that was invoked.
    property type_arn : String | Nil

    # The Amazon Resource Name (ARN) of the target stack or request token of the Cloud Control API
    # operation.
    #
    # Only shown in responses when the request does not specify `TargetType` and `TargetId` filters.
    property hook_execution_target : String | Nil

    def initialize(
      @hook_result_id : String | Nil = nil,
      @invocation_point : HookInvocationPoint | Nil = nil,
      @failure_mode : HookFailureMode | Nil = nil,
      @type_name : String | Nil = nil,
      @type_version_id : String | Nil = nil,
      @type_configuration_version_id : String | Nil = nil,
      @status : HookStatus | Nil = nil,
      @hook_status_reason : String | Nil = nil,
      @invoked_at : Time | Nil = nil,
      @target_type : ListHookResultsTargetType | Nil = nil,
      @target_id : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @hook_execution_target : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @hook_result_id
        params << {"#{prefix}HookResultId", value}
      end

      if value = @invocation_point
        params << {"#{prefix}InvocationPoint", value.to_json_object_key}
      end

      if value = @failure_mode
        params << {"#{prefix}FailureMode", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @type_version_id
        params << {"#{prefix}TypeVersionId", value}
      end

      if value = @type_configuration_version_id
        params << {"#{prefix}TypeConfigurationVersionId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @hook_status_reason
        params << {"#{prefix}HookStatusReason", value}
      end

      if value = @invoked_at
        params << {"#{prefix}InvokedAt", Core::QueryValue.time(value)}
      end

      if value = @target_type
        params << {"#{prefix}TargetType", value.to_json_object_key}
      end

      if value = @target_id
        params << {"#{prefix}TargetId", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @hook_execution_target
        params << {"#{prefix}HookExecutionTarget", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hook_result_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HookResultId']")),
        invocation_point: (n = node.xpath_node("*[local-name()='InvocationPoint']")) ? ACF::HookInvocationPoint.from_json_object_key?(n.content) : nil,
        failure_mode: (n = node.xpath_node("*[local-name()='FailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionId']")),
        type_configuration_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeConfigurationVersionId']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::HookStatus.from_json_object_key?(n.content) : nil,
        hook_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='HookStatusReason']")),
        invoked_at: Core::XMLValue.time(node.xpath_node("*[local-name()='InvokedAt']")),
        target_type: (n = node.xpath_node("*[local-name()='TargetType']")) ? ACF::ListHookResultsTargetType.from_json_object_key?(n.content) : nil,
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetId']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        hook_execution_target: Core::XMLValue.string(node.xpath_node("*[local-name()='HookExecutionTarget']")),
      )
    end
  end
end
