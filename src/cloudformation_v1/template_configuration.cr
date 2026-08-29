private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  class TemplateConfiguration
    property deletion_policy : GeneratedTemplateDeletionPolicy | Nil

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
