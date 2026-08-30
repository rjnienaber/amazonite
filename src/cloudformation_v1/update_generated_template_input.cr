private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class UpdateGeneratedTemplateInput
    # The name or Amazon Resource Name (ARN) of a generated template.
    property generated_template_name : String

    # An optional new name to assign to the generated template.
    property new_generated_template_name : String | Nil

    # An optional list of resources to be added to the generated template.
    property add_resources : Array(ResourceDefinition) | Nil

    # A list of logical ids for resources to remove from the generated template.
    property remove_resources : Array(String) | Nil

    # If `true`, update the resource properties in the generated template with their current live
    # state. This feature is useful when the resource properties in your generated a template does not
    # reflect the live state of the resource properties. This happens when a user update the resource
    # properties after generating a template.
    property refresh_all_resources : Bool | Nil

    # The configuration details of the generated template, including the `DeletionPolicy` and
    # `UpdateReplacePolicy`.
    property template_configuration : TemplateConfiguration | Nil

    def initialize(
      @generated_template_name : String,
      @new_generated_template_name : String | Nil = nil,
      @add_resources : Array(ResourceDefinition) | Nil = nil,
      @remove_resources : Array(String) | Nil = nil,
      @refresh_all_resources : Bool | Nil = nil,
      @template_configuration : TemplateConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GeneratedTemplateName", @generated_template_name}

      if value = @new_generated_template_name
        params << {"#{prefix}NewGeneratedTemplateName", value}
      end

      (@add_resources || [] of ResourceDefinition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddResources.member.#{i}."))
      end

      (@remove_resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveResources.member.#{i}", item}
      end

      if value = @refresh_all_resources
        params << {"#{prefix}RefreshAllResources", Core::QueryValue.bool(value)}
      end

      if value = @template_configuration
        params.concat(value.to_query_params("#{prefix}TemplateConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")).not_nil!,
        new_generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewGeneratedTemplateName']")),
        add_resources: node.xpath_nodes("*[local-name()='AddResources']/*[local-name()='member']").map { |n| ResourceDefinition.from_xml(n) },
        remove_resources: node.xpath_nodes("*[local-name()='RemoveResources']/*[local-name()='member']").map { |n| n.content },
        refresh_all_resources: Core::XMLValue.bool(node.xpath_node("*[local-name()='RefreshAllResources']")),
        template_configuration: node.xpath_node("*[local-name()='TemplateConfiguration']").try { |n| TemplateConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @generated_template_name
        raise Core::ValidationError.new("GeneratedTemplateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GeneratedTemplateName length must be <= 128") if value.size > 128
      end

      if value = @new_generated_template_name
        raise Core::ValidationError.new("NewGeneratedTemplateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewGeneratedTemplateName length must be <= 128") if value.size > 128
      end

      if value = @add_resources
        raise Core::ValidationError.new("AddResources must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("AddResources must have at most 500 item(s)") if value.size > 500
        value.each(&.validate!)
      end

      if value = @remove_resources
        raise Core::ValidationError.new("RemoveResources must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("RemoveResources must have at most 500 item(s)") if value.size > 500
      end

      if value = @template_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@generated_template_name, @new_generated_template_name, @add_resources, @remove_resources, @refresh_all_resources, @template_configuration)
  end
end
