private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetGeneratedTemplateOutput
    property status : GeneratedTemplateStatus | Nil

    property template_body : String | Nil

    def initialize(
      @status : GeneratedTemplateStatus | Nil = nil,
      @template_body : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::GeneratedTemplateStatus.from_json_object_key?(n.content) : nil,
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
      )
    end
  end
end
