private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [UpdateSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateSAMLProvider.html)
  # request.
  class UpdateSAMLProviderResponse
    # The Amazon Resource Name (ARN) of the SAML provider that was updated.
    property saml_provider_arn : String | Nil

    def initialize(
      @saml_provider_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @saml_provider_arn
        params << {"#{prefix}SAMLProviderArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")),
      )
    end

    def validate! : Nil
      if value = @saml_provider_arn
        raise Core::ValidationError.new("SAMLProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SAMLProviderArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@saml_provider_arn)
  end
end
