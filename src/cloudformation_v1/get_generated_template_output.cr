private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class GetGeneratedTemplateOutput
    # The status of the template generation. Supported values are:
    #
    # - `CreatePending` - the creation of the template is pending.
    #
    # - `CreateInProgress` - the creation of the template is in progress.
    #
    # - `DeletePending` - the deletion of the template is pending.
    #
    # - `DeleteInProgress` - the deletion of the template is in progress.
    #
    # - `UpdatePending` - the update of the template is pending.
    #
    # - `UpdateInProgress` - the update of the template is in progress.
    #
    # - `Failed` - the template operation failed.
    #
    # - `Complete` - the template operation is complete.
    property status : GeneratedTemplateStatus | Nil

    # The template body of the generated template, in the language specified by the `Language`
    # parameter.
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
