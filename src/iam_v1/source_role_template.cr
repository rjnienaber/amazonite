private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about the role template that a role was created from.
  class SourceRoleTemplate
    # The Amazon Resource Name (ARN) of the role template that the role was created from.
    property template_arn : String

    # The minor version of the role template that was used to create the role.
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

    def_equals_and_hash(@template_arn, @template_minor_version)
  end
end
