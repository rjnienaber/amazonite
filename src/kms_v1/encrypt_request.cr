private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class EncryptRequest
    include JSON::Serializable

    # Identifies the KMS key to use in the encryption operation. The KMS key must have a `KeyUsage` of
    # `ENCRYPT_DECRYPT`. To find the `KeyUsage` of a KMS key, use the DescribeKey operation.
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

    # Data to be encrypted.
    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes

    # Specifies the encryption context that will be used to encrypt the data. An encryption context is
    # valid only for [cryptographic
    # operations](https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations)
    # with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC
    # algorithms that KMS uses do not support an encryption context.
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

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    # Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The
    # algorithm must be compatible with the KMS key that you specify.
    #
    # This parameter is required only for asymmetric KMS keys. The default value, `SYMMETRIC_DEFAULT`,
    # is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key,
    # we recommend RSAES_OAEP_SHA_256.
    #
    # The SM2PKE algorithm is only available in China Regions.
    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # Checks if your request will succeed. `DryRun` is an optional parameter.
    #
    # To learn more about how to use this parameter, see [Testing your
    # permissions](https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @plaintext : Bytes,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @plaintext, @encryption_context, @grant_tokens, @encryption_algorithm, @dry_run)
  end
end
