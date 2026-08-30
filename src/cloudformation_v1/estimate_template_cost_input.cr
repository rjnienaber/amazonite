private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for an EstimateTemplateCost action.
  class EstimateTemplateCostInput
    # Structure that contains the template body with a minimum length of 1 byte and a maximum length
    # of 51,200 bytes.
    #
    # Conditional: You must pass `TemplateBody` or `TemplateURL`. If both are passed, only
    # `TemplateBody` is used.
    property template_body : String | Nil

    # The URL of a file that contains the template body. The URL must point to a template that's
    # located in an Amazon S3 bucket or a Systems Manager document. The location for an Amazon S3
    # bucket must start with `https://`. URLs from S3 static websites are not supported.
    #
    # Conditional: You must pass `TemplateURL` or `TemplateBody`. If both are passed, only
    # `TemplateBody` is used.
    property template_url : String | Nil

    # A list of `Parameter` structures that specify input parameters.
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

    def_equals_and_hash(@template_body, @template_url, @parameters)
  end
end
