private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetRoleTemplateVersionRequest
    # The Amazon Resource Name (ARN) of the role template whose version you want to retrieve.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property template_arn : String

    # The minor version of the role template to retrieve. If you do not specify a minor version, the
    # service returns the template's default minor version.
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
