private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetTemplateInput
    property stack_name : String | Nil

    property change_set_name : String | Nil

    property template_stage : TemplateStage | Nil

    def initialize(
      @stack_name : String | Nil = nil,
      @change_set_name : String | Nil = nil,
      @template_stage : TemplateStage | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @change_set_name
        params << {"#{prefix}ChangeSetName", value}
      end

      if value = @template_stage
        params << {"#{prefix}TemplateStage", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")),
        template_stage: (n = node.xpath_node("*[local-name()='TemplateStage']")) ? ACF::TemplateStage.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
