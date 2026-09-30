private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class DecryptRequest
    include JSON::Serializable

    # Ciphertext to be decrypted. The blob includes metadata.
    #
    # This parameter is required in all cases except when `DryRun` is `true` and `DryRunModifiers` is
    # set to `IGNORE_CIPHERTEXT`.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # Specifies the encryption context to use when decrypting the data. An encryption context is valid
    # only for [cryptographic
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC
    # algorithms that KMS uses do not support an encryption context.
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

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    # Specifies the KMS key that KMS uses to decrypt the ciphertext.
    #
    # Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a
    # different KMS key, the `Decrypt` operation throws an `IncorrectKeyException`.
    #
    # This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key or
    # when `DryRun` is `true` and `DryRunModifiers` is set to `IGNORE_CIPHERTEXT`. If you used a
    # symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the
    # symmetric ciphertext blob. However, it is always recommended as a best practice. This practice
    # ensures that you use the KMS key that you intend.
    #
    # To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias
    # name, prefix it with `"alias/"`. To specify a KMS key in a different Amazon Web Services
    # account, you should use the key ARN or alias ARN.
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
    property key_id : String | Nil

    # Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same
    # algorithm that was used to encrypt the data. If you specify a different algorithm, the `Decrypt`
    # operation fails.
    #
    # This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.
    # The default value, `SYMMETRIC_DEFAULT`, represents the only supported algorithm that is valid
    # for symmetric encryption KMS keys.
    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # A signed [attestation
    # document](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-concepts.html#term-attestdoc)
    # from an Amazon Web Services Nitro enclave or NitroTPM, and the encryption algorithm to use with
    # the public key in the attestation document. The only valid encryption algorithm is
    # `RSAES_OAEP_SHA_256`.
    #
    # This parameter supports the [Amazon Web Services Nitro Enclaves
    # SDK](https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk) or any
    # Amazon Web Services SDK for Amazon Web Services Nitro Enclaves. It supports any Amazon Web
    # Services SDK for Amazon Web Services NitroTPM.
    #
    # When you use this parameter, instead of returning the plaintext data, KMS encrypts the plaintext
    # data with the public key in the attestation document, and returns the resulting ciphertext in
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

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    # Specifies the modifiers to apply to the dry run operation. `DryRunModifiers` is an optional
    # parameter that only applies when `DryRun` is set to `true`.
    #
    # When set to `IGNORE_CIPHERTEXT`, KMS performs only authorization validation without ciphertext
    # validation. This allows you to test permissions without requiring a valid ciphertext blob.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRunModifiers", converter: Core::ArrayConverter(AK::DryRunModifierType))]
    property dry_run_modifiers : Array(DryRunModifierType) | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @key_id : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @dry_run_modifiers : Array(DryRunModifierType) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ciphertext_blob
        raise Core::ValidationError.new("CiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CiphertextBlob length must be <= 6144") if value.size > 6144
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @recipient
        value.validate!
      end
    end

    def_equals_and_hash(@ciphertext_blob, @encryption_context, @grant_tokens, @key_id, @encryption_algorithm, @recipient, @dry_run, @dry_run_modifiers)
  end
end
