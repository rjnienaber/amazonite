private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ChangeSetHook
    property invocation_point : HookInvocationPoint | Nil

    property failure_mode : HookFailureMode | Nil

    property type_name : String | Nil

    property type_version_id : String | Nil

    property type_configuration_version_id : String | Nil

    property target_details : ChangeSetHookTargetDetails | Nil

    def initialize(
      @invocation_point : HookInvocationPoint | Nil = nil,
      @failure_mode : HookFailureMode | Nil = nil,
      @type_name : String | Nil = nil,
      @type_version_id : String | Nil = nil,
      @type_configuration_version_id : String | Nil = nil,
      @target_details : ChangeSetHookTargetDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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

      if value = @target_details
        params.concat(value.to_query_params("#{prefix}TargetDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        invocation_point: (n = node.xpath_node("*[local-name()='InvocationPoint']")) ? ACF::HookInvocationPoint.from_json_object_key?(n.content) : nil,
        failure_mode: (n = node.xpath_node("*[local-name()='FailureMode']")) ? ACF::HookFailureMode.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeVersionId']")),
        type_configuration_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeConfigurationVersionId']")),
        target_details: node.xpath_node("*[local-name()='TargetDetails']").try { |n| ChangeSetHookTargetDetails.from_xml(n) },
      )
    end
  end
end
