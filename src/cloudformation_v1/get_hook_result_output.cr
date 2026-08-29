private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetHookResultOutput
    property hook_result_id : String | Nil

    property invocation_point : HookInvocationPoint | Nil

    property failure_mode : HookFailureMode | Nil

    property type_name : String | Nil

    property original_type_name : String | Nil

    property type_version_id : String | Nil

    property type_configuration_version_id : String | Nil

    property type_arn : String | Nil

    property status : HookStatus | Nil

    property hook_status_reason : String | Nil

    property invoked_at : Time | Nil

    property target : HookTarget | Nil

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
  end
end
