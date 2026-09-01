private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Specifies `RESOURCE` type target details for activated Hooks.
  class ChangeSetHookResourceTargetDetails
    # The resource's logical ID, which is defined in the stack's template.
    property logical_resource_id : String | Nil

    # The type of CloudFormation resource, such as `AWS::S3::Bucket`.
    property resource_type : String | Nil

    # Specifies the action of the resource.
    property resource_action : ChangeAction | Nil

    def initialize(
      @logical_resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @resource_action : ChangeAction | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @logical_resource_id
        params << {"#{prefix}LogicalResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value}
      end

      if value = @resource_action
        params << {"#{prefix}ResourceAction", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        logical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalResourceId']")),
        resource_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceType']")),
        resource_action: (n = node.xpath_node("*[local-name()='ResourceAction']")) ? ACF::ChangeAction.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ResourceType does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9]{2,64}::[a-zA-Z0-9]{2,64}::[a-zA-Z0-9]{2,64}$"))
      end
    end

    def_equals_and_hash(@logical_resource_id, @resource_type, @resource_action)
  end
end
