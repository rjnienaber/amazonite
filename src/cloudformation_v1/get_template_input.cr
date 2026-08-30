private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for a GetTemplate action.
  class GetTemplateInput
    # The name or the unique stack ID that's associated with the stack, which aren't always
    # interchangeable:
    #
    # - Running stacks: You can specify either the stack's name or its unique stack ID.
    #
    # - Deleted stacks: You must specify the unique stack ID.
    property stack_name : String | Nil

    # The name or Amazon Resource Name (ARN) of a change set for which CloudFormation returns the
    # associated template. If you specify a name, you must also specify the `StackName`.
    property change_set_name : String | Nil

    # For templates that include transforms, the stage of the template that CloudFormation returns. To
    # get the user-submitted template, specify `Original`. To get the template after CloudFormation
    # has processed all transforms, specify `Processed`.
    #
    # If the template doesn't include transforms, `Original` and `Processed` return the same template.
    # By default, CloudFormation specifies `Processed`.
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

    def_equals_and_hash(@stack_name, @change_set_name, @template_stage)
  end
end
