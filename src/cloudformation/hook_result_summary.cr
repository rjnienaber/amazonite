private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
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

    def validate! : Nil
      if value = @hook_result_id
        raise Core::ValidationError.new("HookResultId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("HookResultId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("HookResultId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 196") if value.size > 196
      end

      if value = @type_version_id
        raise Core::ValidationError.new("TypeVersionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeVersionId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("TypeVersionId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9-]+$"))
      end

      if value = @type_configuration_version_id
        raise Core::ValidationError.new("TypeConfigurationVersionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeConfigurationVersionId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("TypeConfigurationVersionId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9-]+$"))
      end

      if value = @hook_status_reason
        raise Core::ValidationError.new("HookStatusReason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HookStatusReason length must be <= 1024") if value.size > 1024
      end

      if value = @target_id
        raise Core::ValidationError.new("TargetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetId length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("TargetId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*|^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end

      if value = @type_arn
        raise Core::ValidationError.new("TypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/hook/[A-Za-z0-9-]+/?$"))
      end

      if value = @hook_execution_target
        raise Core::ValidationError.new("HookExecutionTarget length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HookExecutionTarget length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("HookExecutionTarget does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z][-a-zA-Z0-9]*|arn:[-a-zA-Z0-9:/]*|^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end
    end

    def_equals_and_hash(@hook_result_id, @invocation_point, @failure_mode, @type_name, @type_version_id, @type_configuration_version_id, @status, @hook_status_reason, @invoked_at, @target_type, @target_id, @type_arn, @hook_execution_target)
  end
end
