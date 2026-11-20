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

    # The trusted identity propagation context provider configuration associated with the SAML
    # provider. For more information, see
    # [ContextProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ContextProvider.html).
    #
    # This element is returned only when a trusted identity propagation context provider is configured
    # for the SAML provider.
    property context_provider : ContextProvider | Nil

    # The key hashes associated with the SAML provider, grouped by identity provider issuer. For more
    # information, see
    # [SAMLKeyHashEntry](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SAMLKeyHashEntry.html).
    property saml_key_hashes : Array(SAMLKeyHashEntry) | Nil

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

    # The Amazon Resource Name (ARN) of the IAM Identity Center instance associated with the SAML
    # provider.
    #
    # For the format, see
    # [InstanceMetadata](https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_InstanceMetadata.html)
    # in the *IAM Identity Center API Reference*.
    #
    # This element is returned only when an IAM Identity Center instance is associated with the SAML
    # provider.
    property identity_center_instance_arn : String | Nil

    # The Amazon Resource Name (ARN) of the identity store that is resolved from the associated IAM
    # Identity Center instance.
    #
    # For the format, see
    # [InstanceMetadata](https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_InstanceMetadata.html)
    # in the *IAM Identity Center API Reference*.
    #
    # This element is returned only when an IAM Identity Center instance is associated with the SAML
    # provider.
    property identity_store_arn : String | Nil

    def initialize(
      @saml_provider_uuid : String | Nil = nil,
      @saml_metadata_document : String | Nil = nil,
      @context_provider : ContextProvider | Nil = nil,
      @saml_key_hashes : Array(SAMLKeyHashEntry) | Nil = nil,
      @create_date : Time | Nil = nil,
      @valid_until : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @assertion_encryption_mode : AssertionEncryptionModeType | Nil = nil,
      @private_key_list : Array(SAMLPrivateKey) | Nil = nil,
      @identity_center_instance_arn : String | Nil = nil,
      @identity_store_arn : String | Nil = nil,
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

      if value = @context_provider
        params.concat(value.to_query_params("#{prefix}ContextProvider."))
      end

      (@saml_key_hashes || [] of SAMLKeyHashEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SAMLKeyHashes.member.#{i}."))
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

      if value = @identity_center_instance_arn
        params << {"#{prefix}IdentityCenterInstanceArn", value}
      end

      if value = @identity_store_arn
        params << {"#{prefix}IdentityStoreArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        saml_provider_uuid: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLProviderUUID']")),
        saml_metadata_document: Core::XMLValue.string(node.xpath_node("*[local-name()='SAMLMetadataDocument']")),
        context_provider: node.xpath_node("*[local-name()='ContextProvider']").try { |n| ContextProvider.from_xml(n) },
        saml_key_hashes: node.xpath_nodes("*[local-name()='SAMLKeyHashes']/*[local-name()='member']").map { |n| SAMLKeyHashEntry.from_xml(n) },
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        valid_until: Core::XMLValue.time(node.xpath_node("*[local-name()='ValidUntil']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        assertion_encryption_mode: (n = node.xpath_node("*[local-name()='AssertionEncryptionMode']")) ? AI::AssertionEncryptionModeType.from_json_object_key?(n.content) : nil,
        private_key_list: node.xpath_nodes("*[local-name()='PrivateKeyList']/*[local-name()='member']").map { |n| SAMLPrivateKey.from_xml(n) },
        identity_center_instance_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IdentityCenterInstanceArn']")),
        identity_store_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IdentityStoreArn']")),
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

      if value = @context_provider
        value.validate!
      end

      if value = @saml_key_hashes
        value.each(&.validate!)
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

      if value = @identity_center_instance_arn
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IdentityCenterInstanceArn length must be <= 1224") if value.size > 1224
      end

      if value = @identity_store_arn
        raise Core::ValidationError.new("IdentityStoreArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("IdentityStoreArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@saml_provider_uuid, @saml_metadata_document, @context_provider, @saml_key_hashes, @create_date, @valid_until, @tags, @assertion_encryption_mode, @private_key_list, @identity_center_instance_arn, @identity_store_arn)
  end
end
