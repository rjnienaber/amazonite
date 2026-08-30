private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class DeriveSharedSecretResponse
    include JSON::Serializable

    # Identifies the KMS key used to derive the shared secret.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The raw secret derived from the specified key agreement algorithm, private key in the asymmetric
    # KMS key, and your peer's public key.
    #
    # If the response includes the `CiphertextForRecipient` field, the `SharedSecret` field is null or
    # empty.
    @[JSON::Field(key: "SharedSecret", converter: Core::Base64Converter)]
    property shared_secret : Bytes | Nil

    # The plaintext shared secret encrypted with the public key from the attestation document. This
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

    # Identifies the key agreement algorithm used to derive the shared secret.
    @[JSON::Field(key: "KeyAgreementAlgorithm", converter: AK::KeyAgreementAlgorithmSpec)]
    property key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil

    # The source of the key material for the specified KMS key.
    #
    # When this value is `AWS_KMS`, KMS created the key material. When this value is `EXTERNAL`, the
    # key material was imported or the KMS key doesn't have any key material.
    #
    # The only valid values for DeriveSharedSecret are `AWS_KMS` and `EXTERNAL`. DeriveSharedSecret
    # does not support KMS keys with a `KeyOrigin` value of `AWS_CLOUDHSM` or `EXTERNAL_KEY_STORE`.
    @[JSON::Field(key: "KeyOrigin", converter: AK::OriginType)]
    property key_origin : OriginType | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @shared_secret : Bytes | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_agreement_algorithm : KeyAgreementAlgorithmSpec | Nil = nil,
      @key_origin : OriginType | Nil = nil,
    )
    end
  end
end
