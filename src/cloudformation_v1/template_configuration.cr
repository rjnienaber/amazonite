private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  # The configuration details of a generated template.
  class TemplateConfiguration
    # The `DeletionPolicy` assigned to resources in the generated template. Supported values are:
    #
    # - `DELETE` - delete all resources when the stack is deleted.
    #
    # - `RETAIN` - retain all resources when the stack is deleted.
    #
    # For more information, see [DeletionPolicy
    # attribute](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-deletionpolicy.html)
    # in the *CloudFormation User Guide*.
    property deletion_policy : GeneratedTemplateDeletionPolicy | Nil

    # The `UpdateReplacePolicy` assigned to resources in the generated template. Supported values are:
    #
    # - `DELETE` - delete all resources when the resource is replaced during an update operation.
    #
    # - `RETAIN` - retain all resources when the resource is replaced during an update operation.
    #
    # For more information, see [UpdateReplacePolicy
    # attribute](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatereplacepolicy.html)
    # in the *CloudFormation User Guide*.
    property update_replace_policy : GeneratedTemplateUpdateReplacePolicy | Nil

    def initialize(
      @deletion_policy : GeneratedTemplateDeletionPolicy | Nil = nil,
      @update_replace_policy : GeneratedTemplateUpdateReplacePolicy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @deletion_policy
        params << {"#{prefix}DeletionPolicy", value.to_json_object_key}
      end

      if value = @update_replace_policy
        params << {"#{prefix}UpdateReplacePolicy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deletion_policy: (n = node.xpath_node("*[local-name()='DeletionPolicy']")) ? ACF::GeneratedTemplateDeletionPolicy.from_json_object_key?(n.content) : nil,
        update_replace_policy: (n = node.xpath_node("*[local-name()='UpdateReplacePolicy']")) ? ACF::GeneratedTemplateUpdateReplacePolicy.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
