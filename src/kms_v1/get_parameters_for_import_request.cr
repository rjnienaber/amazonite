private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GetParametersForImportRequest
    include JSON::Serializable

    # The identifier of the KMS key that will be associated with the imported key material. The
    # `Origin` of the KMS key must be `EXTERNAL`.
    #
    # All KMS key types are supported, including multi-Region keys. However, you cannot import key
    # material into a KMS key in a custom key store.
    #
    # Specify the key ID or key ARN of the KMS key.
    #
    # For example:
    #
    # - Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The algorithm you will use with the RSA public key (`PublicKey`) in the response to protect your
    # key material during import. For more information, see [Select a wrapping
    # algorithm](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-get-public-key-and-token.html#select-wrapping-algorithm)
    # in the *Key Management Service Developer Guide*.
    #
    # For RSA_AES wrapping algorithms, you encrypt your key material with an AES key that you
    # generate, then encrypt your AES key with the RSA public key from KMS. For RSAES wrapping
    # algorithms, you encrypt your key material directly with the RSA public key from KMS.
    #
    # The wrapping algorithms that you can use depend on the type of key material that you are
    # importing. To import an RSA private key, you must use an RSA_AES wrapping algorithm.
    #
    # - **RSA_AES_KEY_WRAP_SHA_256** — Supported for wrapping RSA and ECC key material.
    #
    # - **RSA_AES_KEY_WRAP_SHA_1** — Supported for wrapping RSA and ECC key material.
    #
    # - **RSAES_OAEP_SHA_256** — Supported for all types of key material, except RSA key material
    # (private key).
    #
    # You cannot use the RSAES_OAEP_SHA_256 wrapping algorithm with the RSA_2048 wrapping key spec to
    # wrap ECC_NIST_P521 key material.
    #
    # - **RSAES_OAEP_SHA_1** — Supported for all types of key material, except RSA key material
    # (private key).
    #
    # You cannot use the RSAES_OAEP_SHA_1 wrapping algorithm with the RSA_2048 wrapping key spec to
    # wrap ECC_NIST_P521 key material.
    #
    # - **RSAES_PKCS1_V1_5** (Deprecated) — As of October 10, 2023, KMS does not support the
    # RSAES_PKCS1_V1_5 wrapping algorithm.
    @[JSON::Field(key: "WrappingAlgorithm", converter: AK::AlgorithmSpec)]
    property wrapping_algorithm : AlgorithmSpec

    # The type of RSA public key to return in the response. You will use this wrapping key with the
    # specified wrapping algorithm to protect your key material during import.
    #
    # Use the longest RSA wrapping key that is practical.
    #
    # You cannot use an RSA_2048 public key to directly wrap an ECC_NIST_P521 private key. Instead,
    # use an RSA_AES wrapping algorithm or choose a longer RSA public key.
    @[JSON::Field(key: "WrappingKeySpec", converter: AK::WrappingKeySpec)]
    property wrapping_key_spec : WrappingKeySpec

    def initialize(
      @key_id : String,
      @wrapping_algorithm : AlgorithmSpec,
      @wrapping_key_spec : WrappingKeySpec,
    )
    end
  end
end
