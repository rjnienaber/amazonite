private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetGeneratedTemplateInput
    # The language to use to retrieve for the generated template. Supported values are:
    #
    # - `JSON`
    #
    # - `YAML`
    property format : TemplateFormat | Nil

    # The name or Amazon Resource Name (ARN) of the generated template. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}`. For example,
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:generatedtemplate/*2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc*
    # `.
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

    def validate! : Nil
      if value = @generated_template_name
        raise Core::ValidationError.new("GeneratedTemplateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GeneratedTemplateName length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@format, @generated_template_name)
  end
end
