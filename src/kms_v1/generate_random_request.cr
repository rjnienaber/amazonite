module Amazonite::KmsV1
  class GenerateRandomRequest
    include JSON::Serializable

    # The length of the random byte string. This parameter is required.
    @[JSON::Field(key: "NumberOfBytes")]
    property number_of_bytes : Int32 | Nil

    # Generates the random byte string in the CloudHSM cluster that is associated with the specified
    # CloudHSM key store. To find the ID of a custom key store, use the DescribeCustomKeyStores
    # operation.
    #
    # External key store IDs are not valid for this parameter. If you specify the ID of an external
    # key store, `GenerateRandom` throws an `UnsupportedOperationException`.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    # A signed [attestation
    # document](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc)
    # from an Amazon Web Services Nitro enclave or NitroTPM, and the encryption algorithm to use with
    # the public key in the attestation document. The only valid encryption algorithm is
    # `RSAES_OAEP_SHA_256`.
    #
    # This parameter supports the [Amazon Web Services Nitro Enclaves
    # SDK](https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk) or any
    # Amazon Web Services SDK for Amazon Web Services Nitro Enclaves. It supports any Amazon Web
    # Services SDK for Amazon Web Services NitroTPM.
    #
    # When you use this parameter, instead of returning plaintext bytes, KMS encrypts the plaintext
    # bytes under the public key in the attestation document, and returns the resulting ciphertext in
    # the `CiphertextForRecipient` field in the response. This ciphertext can be decrypted only with
    # the private key in the attested environment. The `Plaintext` field in the response is null or
    # empty.
    #
    # For information about the interaction between KMS and Amazon Web Services Nitro Enclaves or
    # Amazon Web Services NitroTPM, see [Cryptographic attestation support in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    def initialize(
      @number_of_bytes : Int32 | Nil = nil,
      @custom_key_store_id : String | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
    )
    end
  end
end
