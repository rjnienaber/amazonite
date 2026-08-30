private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  # Specifies target details for an activated Hook.
  class ChangeSetHookTargetDetails
    # The Hook target type.
    property target_type : HookTargetType | Nil

    # Required if `TargetType` is `RESOURCE`.
    property resource_target_details : ChangeSetHookResourceTargetDetails | Nil

    def initialize(
      @target_type : HookTargetType | Nil = nil,
      @resource_target_details : ChangeSetHookResourceTargetDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @target_type
        params << {"#{prefix}TargetType", value.to_json_object_key}
      end

      if value = @resource_target_details
        params.concat(value.to_query_params("#{prefix}ResourceTargetDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        target_type: (n = node.xpath_node("*[local-name()='TargetType']")) ? ACF::HookTargetType.from_json_object_key?(n.content) : nil,
        resource_target_details: node.xpath_node("*[local-name()='ResourceTargetDetails']").try { |n| ChangeSetHookResourceTargetDetails.from_xml(n) },
      )
    end

    def_equals_and_hash(@target_type, @resource_target_details)
  end
end
