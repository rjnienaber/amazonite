private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateSAMLProviderRequest
    property saml_metadata_document : String

    property name : String

    property tags : Array(Tag) | Nil

    property assertion_encryption_mode : AssertionEncryptionModeType | Nil

    property add_private_key : String | Nil

    def initialize(
      @saml_metadata_document : String,
      @name : String,
      @tags : Array(Tag) | Nil = nil,
      @assertion_encryption_mode : AssertionEncryptionModeType | Nil = nil,
      @add_private_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SAMLMetadataDocument", @saml_metadata_document}

      params << {"#{prefix}Name", @name}

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @assertion_encryption_mode
        params << {"#{prefix}AssertionEncryptionMode", value.to_json_object_key}
      end

      if value = @add_private_key
        params << {"#{prefix}AddPrivateKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_metadata_document: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLMetadataDocument']")).not_nil!,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        assertion_encryption_mode: (n = node.xpath_node("*[local-name()='AssertionEncryptionMode']")) ? AI::AssertionEncryptionModeType.from_json_object_key?(n.content) : nil,
        add_private_key: Core::XMLValue.string(node.xpath_node("*[local-name()='AddPrivateKey']")),
      )
    end
  end
end
