private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class GenerateDataKeyPairRequest
    include JSON::Serializable

    # Specifies the encryption context that will be used when encrypting the private key in the data
    # key pair.
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

    # Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair.
    # You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and
    # origin of your KMS key, use the DescribeKey operation.
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

    # Determines the type of data key pair that is generated.
    #
    # The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or
    # to sign and verify (but not both), the rule that permits you to use ECC KMS keys only to sign
    # and verify, and the rule that permits you to use ML-DSA key pairs to sign and verify only are
    # not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only
    # available in China Regions.
    @[JSON::Field(key: "KeyPairSpec", converter: AK::DataKeyPairSpec)]
    property key_pair_spec : DataKeyPairSpec

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
    # This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves or
    # Amazon Web Services NitroTPM. To call GenerateDataKeyPair generate an attestation document use
    # either [Amazon Web Services Nitro Enclaves
    # SDK](https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk) for an
    # Amazon Web Services Nitro Enclaves or [Amazon Web Services NitroTPM
    # tools](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/attestation-get-doc.html) for Amazon
    # Web Services NitroTPM. Then use the Recipient parameter from any Amazon Web Services SDK to
    # provide the attestation document for the attested environment.
    #
    # When you use this parameter, instead of returning a plaintext copy of the private data key, KMS
    # encrypts the plaintext private data key under the public key in the attestation document, and
    # returns the resulting ciphertext in the `CiphertextForRecipient` field in the response. This
    # ciphertext can be decrypted only with the private key in the attested environment. The
    # `CiphertextBlob` field in the response contains a copy of the private data key encrypted under
    # the KMS key specified by the `KeyId` parameter. The `PrivateKeyPlaintext` field in the response
    # is null or empty.
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
      @key_pair_spec : DataKeyPairSpec,
      @encryption_context : Hash(String, String) | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end

      if value = @recipient
        value.validate!
      end
    end

    def_equals_and_hash(@encryption_context, @key_id, @key_pair_spec, @grant_tokens, @recipient, @dry_run)
  end
end
