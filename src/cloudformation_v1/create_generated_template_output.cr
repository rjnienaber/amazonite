private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateGeneratedTemplateOutput
    # The ID of the generated template.
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
  end
end
