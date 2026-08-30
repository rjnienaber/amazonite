private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `HookTarget` data type.
  class HookTarget
    # The target type.
    property target_type : HookTargetType

    # The target name, for example, `AWS::S3::Bucket`.
    property target_type_name : String

    # The unique identifier of the Hook invocation target.
    property target_id : String

    # The action that invoked the Hook.
    property action : HookTargetAction

    def initialize(
      @target_type : HookTargetType,
      @target_type_name : String,
      @target_id : String,
      @action : HookTargetAction,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TargetType", @target_type.to_json_object_key}

      params << {"#{prefix}TargetTypeName", @target_type_name}

      params << {"#{prefix}TargetId", @target_id}

      params << {"#{prefix}Action", @action.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_type: ((n = node.xpath_node("*[local-name()='TargetType']")) ? ACF::HookTargetType.from_json_object_key?(n.content) : nil).not_nil!,
        target_type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetTypeName']")).not_nil!,
        target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TargetId']")).not_nil!,
        action: ((n = node.xpath_node("*[local-name()='Action']")) ? ACF::HookTargetAction.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def_equals_and_hash(@target_type, @target_type_name, @target_id, @action)
  end
end
