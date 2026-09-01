private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Describes the stack and the template used by the stack.
  class StackDefinition
    # The name associated with the stack.
    property stack_name : String | Nil

    # The file path for the stack template file.
    property template_body : String | Nil

    # The desired final state of the stack template.
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

    def validate! : Nil
      if value = @template_body
        raise Core::ValidationError.new("TemplateBody length must be >= 1") if value.size < 1
      end

      if value = @template_url
        raise Core::ValidationError.new("TemplateURL length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TemplateURL length must be <= 5120") if value.size > 5120
      end
    end

    def_equals_and_hash(@stack_name, @template_body, @template_url)
  end
end
