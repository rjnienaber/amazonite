private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ReEncryptRequest
    include JSON::Serializable

    # Ciphertext of the data to reencrypt.
    #
    # This parameter is required in all cases except when `DryRun` is `true` and `DryRunModifiers` is
    # set to `IGNORE_CIPHERTEXT`.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption
    # context that was used to encrypt the ciphertext.
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
    @[JSON::Field(key: "SourceEncryptionContext")]
    property source_encryption_context : Hash(String, String) | Nil

    # Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.
    #
    # Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a
    # different KMS key, the `ReEncrypt` operation throws an `IncorrectKeyException`.
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
    @[JSON::Field(key: "SourceKeyId")]
    property source_key_id : String | Nil

    # A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric
    # encryption KMS key or an asymmetric KMS key with a `KeyUsage` value of `ENCRYPT_DECRYPT`. To
    # find the `KeyUsage` value of a KMS key, use the DescribeKey operation.
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
    @[JSON::Field(key: "DestinationKeyId")]
    property destination_key_id : String

    # Specifies that encryption context to use when the reencrypting the data.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # A destination encryption context is valid only when the destination KMS key is a symmetric
    # encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include
    # fields for metadata.
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
    @[JSON::Field(key: "DestinationEncryptionContext")]
    property destination_encryption_context : Hash(String, String) | Nil

    # Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is
    # reencrypted. The default value, `SYMMETRIC_DEFAULT`, represents the algorithm used for symmetric
    # encryption KMS keys.
    #
    # Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different
    # algorithm, the decrypt attempt fails.
    #
    # This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.
    @[JSON::Field(key: "SourceEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property source_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted
    # it. The default value, `SYMMETRIC_DEFAULT`, represents the encryption algorithm used for
    # symmetric encryption KMS keys.
    #
    # This parameter is required only when the destination KMS key is an asymmetric KMS key.
    @[JSON::Field(key: "DestinationEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

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
      @destination_key_id : String,
      @ciphertext_blob : Bytes | Nil = nil,
      @source_encryption_context : Hash(String, String) | Nil = nil,
      @source_key_id : String | Nil = nil,
      @destination_encryption_context : Hash(String, String) | Nil = nil,
      @source_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @dry_run_modifiers : Array(DryRunModifierType) | Nil = nil,
    )
    end

    def_equals_and_hash(@ciphertext_blob, @source_encryption_context, @source_key_id, @destination_key_id, @destination_encryption_context, @source_encryption_algorithm, @destination_encryption_algorithm, @grant_tokens, @dry_run, @dry_run_modifiers)
  end
end
