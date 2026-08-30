private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class DecryptResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that was used to decrypt the ciphertext.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    #
    # If the response includes the `CiphertextForRecipient` field, the `Plaintext` field is null or
    # empty.
    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes | Nil

    # The encryption algorithm that was used to decrypt the ciphertext.
    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # The plaintext data encrypted with the public key from the attestation document. This ciphertext
    # can be decrypted only by using a private key from the attested environment.
    #
    # This field is included in the response only when the `Recipient` parameter in the request
    # includes a valid attestation document from an Amazon Web Services Nitro enclave or NitroTPM. For
    # information about the interaction between KMS and Amazon Web Services Nitro Enclaves or Amazon
    # Web Services NitroTPM, see [Cryptographic attestation support in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "CiphertextForRecipient", converter: Core::Base64Converter)]
    property ciphertext_for_recipient : Bytes | Nil

    # The identifier of the key material used to decrypt the ciphertext. This field is present only
    # when the operation uses a symmetric encryption KMS key. This field is omitted if the request
    # includes the `Recipient` parameter.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @plaintext : Bytes | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @plaintext
        raise Core::ValidationError.new("Plaintext length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Plaintext length must be <= 4096") if value.size > 4096
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

    def_equals_and_hash(@key_id, @plaintext, @encryption_algorithm, @ciphertext_for_recipient, @key_material_id)
  end
end
