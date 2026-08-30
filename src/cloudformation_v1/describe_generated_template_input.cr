private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeGeneratedTemplateInput
    # The name or Amazon Resource Name (ARN) of a generated template.
    property generated_template_name : String

    def initialize(
      @generated_template_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GeneratedTemplateName", @generated_template_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")).not_nil!,
      )
    end

    def_equals_and_hash(@generated_template_name)
  end
end
