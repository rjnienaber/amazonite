private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SourceRoleTemplate
    property template_arn : String

    property template_minor_version : Int32

    def initialize(
      @template_arn : String,
      @template_minor_version : Int32,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TemplateArn", @template_arn}

      params << {"#{prefix}TemplateMinorVersion", @template_minor_version.to_s}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateArn']")).not_nil!,
        template_minor_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='TemplateMinorVersion']")).not_nil!,
      )
    end
  end
end
