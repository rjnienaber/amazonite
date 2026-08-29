private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class EstimateTemplateCostInput
    property template_body : String | Nil

    property template_url : String | Nil

    property parameters : Array(Parameter) | Nil

    def initialize(
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @parameters : Array(Parameter) | Nil = nil,
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

      (@parameters || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
      )
    end
  end
end
