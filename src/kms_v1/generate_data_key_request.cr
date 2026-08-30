private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateDataKeyRequest
    include JSON::Serializable

    # Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an
    # asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS
    # key, use the DescribeKey operation.
    #
    # To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias
    # name, prefix it with `"alias/"`. To specify a KMS key in a different Amazon Web Services
    # account, you must use the key ARN or alias ARN.
    #
    # For example:
    #
    # - Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Alias name: `alias/ExampleAlias`
    #
    # - Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey. To get the alias name
    # and alias ARN, use ListAliases.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # Specifies the encryption context that will be used when encrypting the data key.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # An *encryption context* is a collection of non-secret key-value pairs that represent additional
    # authenticated data. When you use an encryption context to encrypt data, you must specify the
    # same (an exact case-sensitive match) encryption context to decrypt the data. An encryption
    # context is supported only on operations with symmetric encryption KMS keys. On operations with
    # symmetric encryption KMS keys, an encryption context is optional, but it is strongly
    # recommended.
    #
    # For more information, see [Encryption
    # context](https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "EncryptionContext")]
    property encryption_context : Hash(String, String) | Nil

    # Specifies the length of the data key in bytes. For example, use the value 64 to generate a
    # 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys,
    # use the `KeySpec` parameter.
    #
    # You must specify either the `KeySpec` or the `NumberOfBytes` parameter (but not both) in every
    # `GenerateDataKey` request.
    @[JSON::Field(key: "NumberOfBytes")]
    property number_of_bytes : Int32 | Nil

    # Specifies the length of the data key. Use `AES_128` to generate a 128-bit symmetric key, or
    # `AES_256` to generate a 256-bit symmetric key.
    #
    # You must specify either the `KeySpec` or the `NumberOfBytes` parameter (but not both) in every
    # `GenerateDataKey` request.
    @[JSON::Field(key: "KeySpec", converter: AK::DataKeySpec)]
    property key_spec : DataKeySpec | Nil

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

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
    # When you use this parameter, instead of returning the plaintext data key, KMS encrypts the
    # plaintext data key under the public key in the attestation document, and returns the resulting
    # ciphertext in the `CiphertextForRecipient` field in the response. This ciphertext can be
    # decrypted only with the private key in the enclave. The `CiphertextBlob` field in the response
    # contains a copy of the data key encrypted under the KMS key specified by the `KeyId` parameter.
    # The `Plaintext` field in the response is null or empty.
    #
    # For information about the interaction between KMS and Amazon Web Services Nitro Enclaves or
    # Amazon Web Services NitroTPM, see [Cryptographic attestation support in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @encryption_context : Hash(String, String) | Nil = nil,
      @number_of_bytes : Int32 | Nil = nil,
      @key_spec : DataKeySpec | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
