private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackDefinition
    property stack_name : String | Nil

    property template_body : String | Nil

    property template_url : String | Nil

    def initialize(
      @stack_name : String | Nil = nil,
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

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
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
      )
    end
  end
end
