private alias Core = Amazonite::Core

module Amazonite::EC2
  # The IAM SAML identity provider used for federated authentication.
  class FederatedAuthenticationRequest
    # The Amazon Resource Name (ARN) of the IAM SAML identity provider.
    property saml_provider_arn : String | Nil

    # The Amazon Resource Name (ARN) of the IAM SAML identity provider for the self-service portal.
    property self_service_saml_provider_arn : String | Nil

    def initialize(
      @saml_provider_arn : String | Nil = nil,
      @self_service_saml_provider_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @saml_provider_arn
        params << {"#{prefix}SAMLProviderArn", value}
      end

      if value = @self_service_saml_provider_arn
        params << {"#{prefix}SelfServiceSAMLProviderArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")),
        self_service_saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SelfServiceSAMLProviderArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@saml_provider_arn, @self_service_saml_provider_arn)
  end
end
