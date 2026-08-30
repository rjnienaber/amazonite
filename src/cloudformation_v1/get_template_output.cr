private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for GetTemplate action.
  class GetTemplateOutput
    # Structure that contains the template body.
    #
    # CloudFormation returns the same template that was used when the stack was created.
    property template_body : String | Nil

    # The stage of the template that you can retrieve. For stacks, the `Original` and `Processed`
    # templates are always available. For change sets, the `Original` template is always available.
    # After CloudFormation finishes creating the change set, the `Processed` template becomes
    # available.
    property stages_available : Array(TemplateStage) | Nil

    def initialize(
      @template_body : String | Nil = nil,
      @stages_available : Array(TemplateStage) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end

      (@stages_available || [] of TemplateStage).each_with_index(1) do |item, i|
        params << {"#{prefix}StagesAvailable.member.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        stages_available: node.xpath_nodes("*[local-name()='StagesAvailable']/*[local-name()='member']").compact_map { |n| ACF::TemplateStage.from_json_object_key?(n.content) },
      )
    end
  end
end
