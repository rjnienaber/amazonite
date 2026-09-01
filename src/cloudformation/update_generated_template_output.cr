private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class UpdateGeneratedTemplateOutput
    # The Amazon Resource Name (ARN) of the generated template. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}`. For example,
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:generatedtemplate/*2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc*
    # `.
    property generated_template_id : String | Nil

    def initialize(
      @generated_template_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @generated_template_id
        params << {"#{prefix}GeneratedTemplateId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        generated_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateId']")),
      )
    end

    def validate! : Nil
      if value = @generated_template_id
        raise Core::ValidationError.new("GeneratedTemplateId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GeneratedTemplateId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@generated_template_id)
  end
end
