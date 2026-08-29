private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class SignRequest
    include JSON::Serializable

    # Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the
    # message. The `KeyUsage` type of the KMS key must be `SIGN_VERIFY`. To find the `KeyUsage` of a
    # KMS key, use the DescribeKey operation.
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

    # Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger
    # message, provide a message digest.
    #
    # If you provide a message digest, use the `DIGEST` value of `MessageType` to prevent the digest
    # from being hashed again while signing.
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
    # hashed again while signing. However, this can cause verification failures when verifying with a
    # system that assumes a single hash.
    #
    # The hashing algorithm that `Sign` uses is based on the `SigningAlgorithm` value.
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

    # A list of grant tokens.
    #
    # Use a grant token when your permission to call this operation comes from a new grant that has
    # not yet achieved *eventual consistency*. For more information, see [Grant
    # token](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token) and [Using
    # a grant token](https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    # Specifies the signing algorithm to use when signing the message.
    #
    # Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS
    # key. When signing with RSA key pairs, RSASSA-PSS algorithms are preferred. We include
    # RSASSA-PKCS1-v1_5 algorithms for compatibility with existing applications.
    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec

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
      @signing_algorithm : SigningAlgorithmSpec,
      @message_type : MessageType | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
