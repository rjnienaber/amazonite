private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetTemplateSummaryInput
    property template_body : String | Nil

    property template_url : String | Nil

    property stack_name : String | Nil

    property stack_set_name : String | Nil

    property call_as : CallAs | Nil

    property template_summary_config : TemplateSummaryConfig | Nil

    def initialize(
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @stack_name : String | Nil = nil,
      @stack_set_name : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @template_summary_config : TemplateSummaryConfig | Nil = nil,
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

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @stack_set_name
        params << {"#{prefix}StackSetName", value}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      if value = @template_summary_config
        params.concat(value.to_query_params("#{prefix}TemplateSummaryConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        template_summary_config: node.xpath_node("*[local-name()='TemplateSummaryConfig']").try { |n| TemplateSummaryConfig.from_xml(n) },
      )
    end
  end
end
