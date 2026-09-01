private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class VerifyRequest
    include JSON::Serializable

    # Identifies the asymmetric KMS key that will be used to verify the signature. This must be the
    # same KMS key that was used to generate the signature. If you specify a different KMS key, the
    # signature verification fails.
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

    # Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a
    # hash digest of the message. If you submit a digest, use the `MessageType` parameter with a value
    # of `DIGEST`.
    #
    # If the message specified here is different from the message that was signed, the signature
    # verification fails. A message and its hash digest are considered to be the same message.
    @[JSON::Field(key: "Message", converter: Core::Base64Converter)]
    property message : Bytes

    # Tells KMS whether the value of the `Message` parameter should be hashed as part of the signing
    # algorithm. Use `RAW` for unhashed messages; use `DIGEST` for message digests, which are already
    # hashed; use `EXTERNAL_MU` for 64-byte representative μ used in ML-DSA signing as defined in NIST
    # FIPS 204 Section 6.2.
    #
    # When the value of `MessageType` is `RAW`, KMS uses the standard signing algorithm, which begins
    # with a hash function. When the value is `DIGEST`, KMS skips the hashing step in the signing
    # algorithm. When the value is `EXTERNAL_MU` KMS skips the concatenated hashing of the public key
    # hash and the message done in the ML-DSA signing algorithm.
    #
    # Use the `DIGEST` or `EXTERNAL_MU` value only when the value of the `Message` parameter is a
    # message digest. If you use the `DIGEST` value with an unhashed message, the security of the
    # signing operation can be compromised.
    #
    # When using ECC_NIST_EDWARDS25519 KMS keys:
    #
    # - ED25519_SHA_512 signing algorithm requires KMS `MessageType:RAW`
    #
    # - ED25519_PH_SHA_512 signing algorithm requires KMS `MessageType:DIGEST`
    #
    # When you specify the ED25519_PH_SHA_512 signing algorithm with `MessageType:DIGEST`, KMS still
    # performs the SHA-512 prehash described in [Step 1 of Section 7.8.1 in FIPS
    # 186-5](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-5.pdf#page=39). This means the input
    # is hashed twice: once by you and once by KMS.
    #
    # When the value of `MessageType` is `DIGEST`, the length of the `Message` value must match the
    # length of hashed messages for the specified signing algorithm.
    #
    # When the value of `MessageType` is `EXTERNAL_MU` the length of the `Message` value must be 64
    # bytes.
    #
    # You can submit a message digest and omit the `MessageType` or specify `RAW` so the digest is
    # hashed again while signing. However, if the signed message is hashed once while signing, but
    # twice while verifying, verification fails, even when the message hasn't changed.
    #
    # The hashing algorithm that `Verify` uses is based on the `SigningAlgorithm` value.
    #
    # - Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.
    #
    # - Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.
    #
    # - Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.
    #
    # - Signing algorithms that end in SHAKE_256 use the SHAKE_256 hashing algorithm.
    #
    # - SM2DSA uses the SM3 hashing algorithm. For details, see [Offline verification with SM2 key
    # pairs](https://docs.aws.amazon.com/kms/latest/developerguide/offline-operations.html#key-spec-sm-offline-verification).
    @[JSON::Field(key: "MessageType", converter: AK::MessageType)]
    property message_type : MessageType | Nil

    # The signature that the `Sign` operation generated.
    @[JSON::Field(key: "Signature", converter: Core::Base64Converter)]
    property signature : Bytes

    # The signing algorithm that was used to sign the message. If you submit a different algorithm,
    # the signature verification fails.
    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec

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
      @message : Bytes,
      @signature : Bytes,
      @signing_algorithm : SigningAlgorithmSpec,
      @message_type : MessageType | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @message
        raise Core::ValidationError.new("Message length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Message length must be <= 4096") if value.size > 4096
      end

      if value = @signature
        raise Core::ValidationError.new("Signature length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Signature length must be <= 6144") if value.size > 6144
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key_id, @message, @message_type, @signature, @signing_algorithm, @grant_tokens, @dry_run)
  end
end
