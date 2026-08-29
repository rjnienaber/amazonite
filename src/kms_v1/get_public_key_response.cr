private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetPublicKeyResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # asymmetric KMS key from which the public key was downloaded.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The exported public key.
    #
    # The value is a DER-encoded X.509 public key, also known as `SubjectPublicKeyInfo` (SPKI), as
    # defined in [RFC 5280](https://tools.ietf.org/html/rfc5280). When you use the HTTP API or the
    # Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes | Nil

    # Instead, use the `KeySpec` field in the `GetPublicKey` response.
    #
    # The `KeySpec` and `CustomerMasterKeySpec` fields have the same value. We recommend that you use
    # the `KeySpec` field in your code. However, to avoid breaking changes, KMS supports both fields.
    @[JSON::Field(key: "CustomerMasterKeySpec", converter: AK::CustomerMasterKeySpec)]
    property customer_master_key_spec : CustomerMasterKeySpec | Nil

    # The type of the of the public key that was downloaded.
    @[JSON::Field(key: "KeySpec", converter: AK::KeySpec)]
    property key_spec : KeySpec | Nil

    # The permitted use of the public key. Valid values for asymmetric key pairs are
    # `ENCRYPT_DECRYPT`, `SIGN_VERIFY`, and `KEY_AGREEMENT`.
    #
    # This information is critical. For example, if a public key with `SIGN_VERIFY` key usage encrypts
    # data outside of KMS, the ciphertext cannot be decrypted.
    @[JSON::Field(key: "KeyUsage", converter: AK::KeyUsageType)]
    property key_usage : KeyUsageType | Nil

    # The encryption algorithms that KMS supports for this key.
    #
    # This information is critical. If a public key encrypts data outside of KMS by using an
    # unsupported encryption algorithm, the ciphertext cannot be decrypted.
    #
    # This field appears in the response only when the `KeyUsage` of the public key is
    # `ENCRYPT_DECRYPT`.
    @[JSON::Field(key: "EncryptionAlgorithms", converter: Core::ArrayConverter(AK::EncryptionAlgorithmSpec))]
    property encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil

    # The signing algorithms that KMS supports for this key.
    #
    # This field appears in the response only when the `KeyUsage` of the public key is `SIGN_VERIFY`.
    @[JSON::Field(key: "SigningAlgorithms", converter: Core::ArrayConverter(AK::SigningAlgorithmSpec))]
    property signing_algorithms : Array(SigningAlgorithmSpec) | Nil

    # The key agreement algorithm used to derive a shared secret. This field is present only when the
    # KMS key has a `KeyUsage` value of `KEY_AGREEMENT`.
    @[JSON::Field(key: "KeyAgreementAlgorithms", converter: Core::ArrayConverter(AK::KeyAgreementAlgorithmSpec))]
    property key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @public_key : Bytes | Nil = nil,
      @customer_master_key_spec : CustomerMasterKeySpec | Nil = nil,
      @key_spec : KeySpec | Nil = nil,
      @key_usage : KeyUsageType | Nil = nil,
      @encryption_algorithms : Array(EncryptionAlgorithmSpec) | Nil = nil,
      @signing_algorithms : Array(SigningAlgorithmSpec) | Nil = nil,
      @key_agreement_algorithms : Array(KeyAgreementAlgorithmSpec) | Nil = nil,
    )
    end
  end
end
