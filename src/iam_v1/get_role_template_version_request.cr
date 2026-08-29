private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetRoleTemplateVersionRequest
    property template_arn : String

    property minor_version : Int32 | Nil

    def initialize(
      @template_arn : String,
      @minor_version : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TemplateArn", @template_arn}

      if value = @minor_version
        params << {"#{prefix}MinorVersion", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateArn']")).not_nil!,
        minor_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinorVersion']")),
      )
    end
  end
end
