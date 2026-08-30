private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Specifies the resource, the Hook, and the Hook version to be invoked.
  class ChangeSetHook
    # The specific point in the provisioning process where the Hook is invoked.
    property invocation_point : HookInvocationPoint | Nil

    # Specify the Hook failure mode for non-compliant resources in the followings ways.
    #
    # - `FAIL` Stops provisioning resources.
    #
    # - `WARN` Allows provisioning to continue with a warning message.
    property failure_mode : HookFailureMode | Nil

    # The unique name for your Hook. Specifies a three-part namespace for your Hook, with a
    # recommended pattern of `Organization::Service::Hook`.
    #
    # The following organization namespaces are reserved and can't be used in your Hook type names:
    #
    # - `Alexa`
    #
    # - `AMZN`
    #
    # - `Amazon`
    #
    # - `ASK`
    #
    # - `AWS`
    #
    # - `Custom`
    #
    # - `Dev`
    property type_name : String | Nil

    # The version ID of the type specified.
    property type_version_id : String | Nil

    # The version ID of the type configuration.
    property type_configuration_version_id : String | Nil

    # Specifies details about the target that the Hook will run against.
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

    def validate! : Nil
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

      if value = @target_details
        value.validate!
      end
    end

    def_equals_and_hash(@invocation_point, @failure_mode, @type_name, @type_version_id, @type_configuration_version_id, @target_details)
  end
end
