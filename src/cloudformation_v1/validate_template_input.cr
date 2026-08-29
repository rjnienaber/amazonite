private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ValidateTemplateInput
    property template_body : String | Nil

    property template_url : String | Nil

    def initialize(
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end

      if value = @template_url
        params << {"#{prefix}TemplateURL", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
      )
    end
  end
end
