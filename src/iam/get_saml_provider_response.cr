private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [GetSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html)
  # request.
  class GetSAMLProviderResponse
    # The unique identifier assigned to the SAML provider.
    property saml_provider_uuid : String | Nil

    # The XML metadata document that includes information about an identity provider.
    property saml_metadata_document : String | Nil

    # The date and time when the SAML provider was created.
    property create_date : Time | Nil

    # The expiration date and time for the SAML provider.
    property valid_until : Time | Nil

    # A list of tags that are attached to the specified IAM SAML provider. The returned list of tags
    # is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    # Specifies the encryption setting for the SAML provider.
    property assertion_encryption_mode : AssertionEncryptionModeType | Nil

    # The private key metadata for the SAML provider.
    property private_key_list : Array(SAMLPrivateKey) | Nil

    def initialize(
      @saml_provider_uuid : String | Nil = nil,
      @saml_metadata_document : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @assertion_encryption_mode : AssertionEncryptionModeType | Nil = nil,
      @private_key_list : Array(SAMLPrivateKey) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @saml_provider_uuid
        params << {"#{prefix}SAMLProviderUUID", value}
      end

      if value = @saml_metadata_document
        params << {"#{prefix}SAMLMetadataDocument", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @valid_until
        params << {"#{prefix}ValidUntil", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @assertion_encryption_mode
        params << {"#{prefix}AssertionEncryptionMode", value.to_json_object_key}
      end

      (@private_key_list || [] of SAMLPrivateKey).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateKeyList.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_uuid: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderUUID']")),
        saml_metadata_document: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLMetadataDocument']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidUntil']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        assertion_encryption_mode: (n = node.xpath_node("*[local-name()='AssertionEncryptionMode']")) ? AI::AssertionEncryptionModeType.from_json_object_key?(n.content) : nil,
        private_key_list: node.xpath_nodes("*[local-name()='PrivateKeyList']/*[local-name()='member']").map { |n| SAMLPrivateKey.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @saml_provider_uuid
        raise Core::ValidationError.new("SAMLProviderUUID length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("SAMLProviderUUID length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("SAMLProviderUUID does not match the required pattern") unless value.matches?(Regex.new("^[A-Z0-9]+$"))
      end

      if value = @saml_metadata_document
        raise Core::ValidationError.new("SAMLMetadataDocument length must be >= 1000") if value.size < 1000
        raise Core::ValidationError.new("SAMLMetadataDocument length must be <= 10000000") if value.size > 10000000
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @private_key_list
        raise Core::ValidationError.new("PrivateKeyList must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("PrivateKeyList must have at most 2 item(s)") if value.size > 2
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@saml_provider_uuid, @saml_metadata_document, @create_date, @valid_until, @tags, @assertion_encryption_mode, @private_key_list)
  end
end
