private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class DeriveSharedSecretRequest
    include JSON::Serializable

    # Identifies an asymmetric NIST-standard ECC or SM2 (China Regions only) KMS key. KMS uses the
    # private key in the specified key pair to derive the shared secret. The key usage of the KMS key
    # must be `KEY_AGREEMENT`. To find the `KeyUsage` of a KMS key, use the DescribeKey operation.
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

    # Specifies the key agreement algorithm used to derive the shared secret. The only valid value is
    # `ECDH`.
    @[JSON::Field(key: "KeyAgreementAlgorithm", converter: AK::KeyAgreementAlgorithmSpec)]
    property key_agreement_algorithm : KeyAgreementAlgorithmSpec

    # Specifies the public key in your peer's NIST-standard elliptic curve (ECC) or SM2 (China Regions
    # only) key pair.
    #
    # The public key must be a DER-encoded X.509 public key, also known as `SubjectPublicKeyInfo`
    # (SPKI), as defined in [RFC 5280](https://tools.ietf.org/html/rfc5280).
    #
    # GetPublicKey returns the public key of an asymmetric KMS key pair in the required DER-encoded
    # format.
    #
    # If you use [Amazon Web Services CLI version
    # 1](https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-welcome.html), you must provide the
    # DER-encoded X.509 public key in a file. Otherwise, the Amazon Web Services CLI Base64-encodes
    # the public key a second time, resulting in a `ValidationException`.
    #
    # You can specify the public key as binary data in a file using fileb (`fileb://`) or in-line
    # using a Base64 encoded string.
    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes

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

    # A signed [attestation
    # document](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc)
    # from an Amazon Web Services Nitro enclave or NitroTPM, and the encryption algorithm to use with
    # the public key in the attestation document. The only valid encryption algorithm is
    # `RSAES_OAEP_SHA_256`.
    #
    # This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves or
    # Amazon Web Services NitroTPM. To call DeriveSharedSecret generate an attestation document use
    # either [Amazon Web Services Nitro Enclaves
    # SDK](https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk) for an
    # Amazon Web Services Nitro Enclaves or [Amazon Web Services NitroTPM
    # tools](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/attestation-get-doc.html) for Amazon
    # Web Services NitroTPM. Then use the Recipient parameter from any Amazon Web Services SDK to
    # provide the attestation document for the attested environment.
    #
    # When you use this parameter, instead of returning a plaintext copy of the shared secret, KMS
    # encrypts the plaintext shared secret under the public key in the attestation document, and
    # returns the resulting ciphertext in the `CiphertextForRecipient` field in the response. This
    # ciphertext can be decrypted only with the private key in the attested environment. The
    # `CiphertextBlob` field in the response contains the encrypted shared secret derived from the KMS
    # key specified by the `KeyId` parameter and public key specified by the `PublicKey` parameter.
    # The `SharedSecret` field in the response is null or empty.
    #
    # For information about the interaction between KMS and Amazon Web Services Nitro Enclaves or
    # Amazon Web Services NitroTPM, see [Cryptographic attestation support in
    # KMS](https://docs.aws.amazon.com/kms/latest/developerguide/cryptographic-attestation.html) in
    # the *Key Management Service Developer Guide*.
    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    def initialize(
      @key_id : String,
      @key_agreement_algorithm : KeyAgreementAlgorithmSpec,
      @public_key : Bytes,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @public_key
        raise Core::ValidationError.new("PublicKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublicKey length must be <= 8192") if value.size > 8192
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end

      if value = @recipient
        value.validate!
      end
    end

    def_equals_and_hash(@key_id, @key_agreement_algorithm, @public_key, @grant_tokens, @dry_run, @recipient)
  end
end
