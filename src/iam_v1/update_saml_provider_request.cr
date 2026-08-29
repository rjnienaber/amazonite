private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateSAMLProviderRequest
    property saml_metadata_document : String | Nil

    property saml_provider_arn : String

    property assertion_encryption_mode : AssertionEncryptionModeType | Nil

    property add_private_key : String | Nil

    property remove_private_key : String | Nil

    def initialize(
      @saml_provider_arn : String,
      @saml_metadata_document : String | Nil = nil,
      @assertion_encryption_mode : AssertionEncryptionModeType | Nil = nil,
      @add_private_key : String | Nil = nil,
      @remove_private_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @saml_metadata_document
        params << {"#{prefix}SAMLMetadataDocument", value}
      end

      params << {"#{prefix}SAMLProviderArn", @saml_provider_arn}

      if value = @assertion_encryption_mode
        params << {"#{prefix}AssertionEncryptionMode", value.to_json_object_key}
      end

      if value = @add_private_key
        params << {"#{prefix}AddPrivateKey", value}
      end

      if value = @remove_private_key
        params << {"#{prefix}RemovePrivateKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_metadata_document: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLMetadataDocument']")),
        saml_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderArn']")).not_nil!,
        assertion_encryption_mode: (n = node.xpath_node("*[local-name()='AssertionEncryptionMode']")) ? AI::AssertionEncryptionModeType.from_json_object_key?(n.content) : nil,
        add_private_key: Core::XMLValue.string(node.xpath_node("*[local-name()='AddPrivateKey']")),
        remove_private_key: Core::XMLValue.string(node.xpath_node("*[local-name()='RemovePrivateKey']")),
      )
    end
  end
end
