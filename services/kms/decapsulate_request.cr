private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class DecapsulateRequest
    include JSON::Serializable

    # Identifies the asymmetric ML-KEM KMS key whose public key was used to produce the encapsulated
    # shared secret. KMS uses the private key in the specified key pair to decapsulate the shared
    # secret.
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

    # The encapsulated (ciphertext) form of the shared secret to recover. This is the
    # `SharedSecretCiphertextBlob` value that the Encapsulate operation returns. When you use the HTTP
    # API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not
    # Base64-encoded.
    @[JSON::Field(key: "SharedSecretCiphertextBlob", converter: Core::Base64Converter)]
    property shared_secret_ciphertext_blob : Bytes

    # Specifies the key encapsulation algorithm used to recover the shared secret. The only valid
    # value is `ML_KEM`.
    @[JSON::Field(key: "EncapsulationAlgorithm", converter: AK::EncapsulationAlgorithmSpec)]
    property encapsulation_algorithm : EncapsulationAlgorithmSpec

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
      @shared_secret_ciphertext_blob : Bytes,
      @encapsulation_algorithm : EncapsulationAlgorithmSpec,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @shared_secret_ciphertext_blob
        raise Core::ValidationError.new("SharedSecretCiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SharedSecretCiphertextBlob length must be <= 6144") if value.size > 6144
      end

      if value = @grant_tokens
        raise Core::ValidationError.new("GrantTokens must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("GrantTokens must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@key_id, @shared_secret_ciphertext_blob, @encapsulation_algorithm, @grant_tokens, @dry_run)
  end
end
