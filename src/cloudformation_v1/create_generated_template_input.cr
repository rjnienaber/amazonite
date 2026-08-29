private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class CreateGeneratedTemplateInput
    property resources : Array(ResourceDefinition) | Nil

    property generated_template_name : String

    property stack_name : String | Nil

    property template_configuration : TemplateConfiguration | Nil

    def initialize(
      @generated_template_name : String,
      @resources : Array(ResourceDefinition) | Nil = nil,
      @stack_name : String | Nil = nil,
      @template_configuration : TemplateConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@resources || [] of ResourceDefinition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Resources.member.#{i}."))
      end

      params << {"#{prefix}GeneratedTemplateName", @generated_template_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @template_configuration
        params.concat(value.to_query_params("#{prefix}TemplateConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resources: node.xpath_nodes("*[local-name()='Resources']/*[local-name()='member']").map { |n| ResourceDefinition.from_xml(n) },
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        template_configuration: node.xpath_node("*[local-name()='TemplateConfiguration']").try { |n| TemplateConfiguration.from_xml(n) },
      )
    end
  end
end
