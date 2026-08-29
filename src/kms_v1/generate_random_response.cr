private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateRandomResponse
    include JSON::Serializable

    # The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    #
    # If the response includes the `CiphertextForRecipient` field, the `Plaintext` field is null or
    # empty.
    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes | Nil

    # The plaintext random bytes encrypted with the public key from the attestation document. This
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

    def initialize(
      @plaintext : Bytes | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
    )
    end
  end
end
