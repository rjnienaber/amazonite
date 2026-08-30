private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteSAMLProviderRequest
    # The Amazon Resource Name (ARN) of the SAML provider to delete.
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

    def validate! : Nil
      if value = @saml_provider_arn
        raise Core::ValidationError.new("SAMLProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SAMLProviderArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@saml_provider_arn)
  end
end
