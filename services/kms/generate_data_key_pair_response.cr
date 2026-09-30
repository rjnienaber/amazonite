private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class GenerateDataKeyPairResponse
    include JSON::Serializable

    # The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI,
    # the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "PrivateKeyCiphertextBlob", converter: Core::Base64Converter)]
    property private_key_ciphertext_blob : Bytes | Nil

    # The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI,
    # the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    #
    # If the response includes the `CiphertextForRecipient` field, the `PrivateKeyPlaintext` field is
    # null or empty.
    @[JSON::Field(key: "PrivateKeyPlaintext", converter: Core::Base64Converter)]
    property private_key_plaintext : Bytes | Nil

    # The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the
    # value is Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that encrypted the private key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The type of data key pair that was generated.
    @[JSON::Field(key: "KeyPairSpec", converter: AK::DataKeyPairSpec)]
    property key_pair_spec : DataKeyPairSpec | Nil

    # The plaintext private data key encrypted with the public key from the attestation document. This
    # ciphertext can be decrypted only by using a private key from the attested environment.
    #
    # This field is included in the response only when the `Recipient` parameter in the request
    # includes a valid attestation document from an Amazon Web Services Nitro enclave or NitroTPM. For
    # information about the interaction between KMS and Amazon Web Services Nitro Enclaves or Amazon
    # Web Services NitroTPM, see [Cryptographic attestation support in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "CiphertextForRecipient", converter: Core::Base64Converter)]
    property ciphertext_for_recipient : Bytes | Nil

    # The identifier of the key material used to encrypt the private key.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @private_key_ciphertext_blob : Bytes | Nil = nil,
      @private_key_plaintext : Bytes | Nil = nil,
      @public_key : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @key_pair_spec : DataKeyPairSpec | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @private_key_ciphertext_blob
        raise Core::ValidationError.new("PrivateKeyCiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrivateKeyCiphertextBlob length must be <= 6144") if value.size > 6144
      end

      if value = @private_key_plaintext
        raise Core::ValidationError.new("PrivateKeyPlaintext length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrivateKeyPlaintext length must be <= 4096") if value.size > 4096
      end

      if value = @public_key
        raise Core::ValidationError.new("PublicKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublicKey length must be <= 8192") if value.size > 8192
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @ciphertext_for_recipient
        raise Core::ValidationError.new("CiphertextForRecipient length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CiphertextForRecipient length must be <= 6144") if value.size > 6144
      end

      if value = @key_material_id
        raise Core::ValidationError.new("KeyMaterialId length must be >= 64") if value.size < 64
        raise Core::ValidationError.new("KeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("KeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end
    end

    def_equals_and_hash(@private_key_ciphertext_blob, @private_key_plaintext, @public_key, @key_id, @key_pair_spec, @ciphertext_for_recipient, @key_material_id)
  end
end
