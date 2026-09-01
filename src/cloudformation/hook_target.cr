private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
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

    def validate! : Nil
      if value = @target_type_name
        raise Core::ValidationError.new("TargetTypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetTypeName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TargetTypeName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9]{2,64}::[a-zA-Z0-9]{2,64}::[a-zA-Z0-9]{2,64}$"))
      end

      if value = @target_id
        raise Core::ValidationError.new("TargetId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TargetId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TargetId does not match the required pattern") unless value.matches?(Regex.new("^[^_]*$"))
      end
    end

    def_equals_and_hash(@target_type, @target_type_name, @target_id, @action)
  end
end
