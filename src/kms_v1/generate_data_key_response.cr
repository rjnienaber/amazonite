private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateDataKeyResponse
    include JSON::Serializable

    # The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI,
    # the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data
    # outside of KMS. Then, remove it from memory as soon as possible.
    #
    # If the response includes the `CiphertextForRecipient` field, the `Plaintext` field is null or
    # empty.
    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that encrypted the data key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The plaintext data key encrypted with the public key from the attestation document. This
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

    # The identifier of the key material used to encrypt the data key. This field is omitted if the
    # request includes the `Recipient` parameter.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @plaintext : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
