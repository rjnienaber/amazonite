private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetGeneratedTemplateInput
    property format : TemplateFormat | Nil

    property generated_template_name : String

    def initialize(
      @generated_template_name : String,
      @format : TemplateFormat | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @format
        params << {"#{prefix}Format", value.to_json_object_key}
      end

      params << {"#{prefix}GeneratedTemplateName", @generated_template_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        format: (n = node.xpath_node("*[local-name()='Format']")) ? ACF::TemplateFormat.from_json_object_key?(n.content) : nil,
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")).not_nil!,
      )
    end
  end
end
