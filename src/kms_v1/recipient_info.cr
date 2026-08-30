private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains information about the party that receives the response from the API operation.
  #
  # This data type is designed to support Amazon Web Services Nitro Enclaves and Amazon Web Services
  # NitroTPM, which lets you create an attested environment in Amazon EC2. For information about the
  # interaction between KMS and Amazon Web Services Nitro Enclaves or Amazon Web Services NitroTPM,
  # see [Cryptographic attestation support in
  # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
  # the *Key Management Service Developer Guide*.
  class RecipientInfo
    include JSON::Serializable

    # The encryption algorithm that KMS should use with the public key for an Amazon Web Services
    # Nitro Enclave or NitroTPM to encrypt plaintext values for the response. The only valid value is
    # `RSAES_OAEP_SHA_256`.
    @[JSON::Field(key: "KeyEncryptionAlgorithm", converter: AK::KeyEncryptionMechanism)]
    property key_encryption_algorithm : KeyEncryptionMechanism | Nil

    # The attestation document for an Amazon Web Services Nitro Enclave or a NitroTPM. This document
    # includes the enclave's public key.
    @[JSON::Field(key: "AttestationDocument", converter: Core::Base64Converter)]
    property attestation_document : Bytes | Nil

    def initialize(
      @key_encryption_algorithm : KeyEncryptionMechanism | Nil = nil,
      @attestation_document : Bytes | Nil = nil,
    )
    end

    def_equals_and_hash(@key_encryption_algorithm, @attestation_document)
  end
end
