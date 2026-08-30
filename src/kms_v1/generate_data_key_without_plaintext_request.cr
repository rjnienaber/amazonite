private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateDataKeyWithoutPlaintextRequest
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

    # The length of the data key. Use `AES_128` to generate a 128-bit symmetric key, or `AES_256` to
    # generate a 256-bit symmetric key.
    @[JSON::Field(key: "KeySpec", converter: AK::DataKeySpec)]
    property key_spec : DataKeySpec | Nil

    # The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data
    # key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we
    # recommend that you use the `KeySpec` field instead of this one.
    @[JSON::Field(key: "NumberOfBytes")]
    property number_of_bytes : Int32 | Nil

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

    def initialize(
      @key_id : String,
      @encryption_context : Hash(String, String) | Nil = nil,
      @key_spec : DataKeySpec | Nil = nil,
      @number_of_bytes : Int32 | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @encryption_context, @key_spec, @number_of_bytes, @grant_tokens, @dry_run)
  end
end
