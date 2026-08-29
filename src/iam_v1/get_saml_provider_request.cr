private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetSAMLProviderRequest
    # The Amazon Resource Name (ARN) of the SAML provider resource object in IAM to get information
    # about.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property saml_provider_arn : String

    def initialize(
      @saml_provider_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SAMLProviderArn", @saml_provider_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")).not_nil!,
      )
    end
  end
end
