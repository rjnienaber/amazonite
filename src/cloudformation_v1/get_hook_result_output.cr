private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetHookResultOutput
    # The unique identifier of the Hook result.
    property hook_result_id : String | Nil

    # The specific point in the provisioning process where the Hook is invoked.
    property invocation_point : HookInvocationPoint | Nil

    # The failure mode of the invocation.
    property failure_mode : HookFailureMode | Nil

    # The name of the Hook that was invoked.
    property type_name : String | Nil

    # The original public type name of the Hook when an alias is used.
    #
    # For example, if you activate `AWS::Hooks::GuardHook` with alias `MyCompany::Custom::GuardHook`,
    # then `TypeName` will be `MyCompany::Custom::GuardHook` and `OriginalTypeName` will be
    # `AWS::Hooks::GuardHook`.
    property original_type_name : String | Nil

    # The version identifier of the Hook that was invoked.
    property type_version_id : String | Nil

    # The version identifier of the Hook configuration data that was used during invocation.
    property type_configuration_version_id : String | Nil

    # The Amazon Resource Name (ARN) of the Hook.
    property type_arn : String | Nil

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

    # A message that provides additional details about the Hook invocation status.
    property hook_status_reason : String | Nil

    # The timestamp when the Hook was invoked.
    property invoked_at : Time | Nil

    # Information about the target of the Hook invocation.
    property target : HookTarget | Nil

    # A list of objects with additional information and guidance that can help you resolve a failed
    # Hook invocation.
    property annotations : Array(Annotation) | Nil

    def initialize(
      @hook_result_id : String | Nil = nil,
      @invocation_point : HookInvocationPoint | Nil = nil,
      @failure_mode : HookFailureMode | Nil = nil,
      @type_name : String | Nil = nil,
      @original_type_name : String | Nil = nil,
      @type_version_id : String | Nil = nil,
      @type_configuration_version_id : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @status : HookStatus | Nil = nil,
      @hook_status_reason : String | Nil = nil,
      @invoked_at : Time | Nil = nil,
      @target : HookTarget | Nil = nil,
      @annotations : Array(Annotation) | Nil = nil,
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

      if value = @original_type_name
        params << {"#{prefix}OriginalTypeName", value}
      end

      if value = @type_version_id
        params << {"#{prefix}TypeVersionId", value}
      end

      if value = @type_configuration_version_id
        params << {"#{prefix}TypeConfigurationVersionId", value}
      end

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
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

      if value = @target
        params.concat(value.to_query_params("#{prefix}Target."))
      end

      (@annotations || [] of Annotation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Annotations.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hook_result_id: Core::XMLValue.string(node.xpath_node("*[local-name()='HookResultId']")),
        invocation_point: (n = node.xpath_node("*[local-name()='InvocationPoint']")) ? ACF::HookInvocationPoint.from_json_object_key?(n.content) : nil,
        failure_mode: (n = node.xpath_node("*[local-name()='FailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        original_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OriginalTypeName']")),
        type_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionId']")),
        type_configuration_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeConfigurationVersionId']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::HookStatus.from_json_object_key?(n.content) : nil,
        hook_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='HookStatusReason']")),
        invoked_at: Core::XMLValue.time(node.xpath_node("*[local-name()='InvokedAt']")),
        target: node.xpath_node("*[local-name()='Target']").try { |n| HookTarget.from_xml(n) },
        annotations: node.xpath_nodes("*[local-name()='Annotations']/*[local-name()='member']").map { |n| Annotation.from_xml(n) },
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

      if value = @original_type_name
        raise Core::ValidationError.new("OriginalTypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("OriginalTypeName length must be <= 196") if value.size > 196
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

      if value = @type_arn
        raise Core::ValidationError.new("TypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/hook/[A-Za-z0-9-]+/?$"))
      end

      if value = @hook_status_reason
        raise Core::ValidationError.new("HookStatusReason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("HookStatusReason length must be <= 1024") if value.size > 1024
      end

      if value = @target
        value.validate!
      end

      if value = @annotations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@hook_result_id, @invocation_point, @failure_mode, @type_name, @original_type_name, @type_version_id, @type_configuration_version_id, @type_arn, @status, @hook_status_reason, @invoked_at, @target, @annotations)
  end
end
