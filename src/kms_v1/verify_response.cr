private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class VerifyResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # asymmetric KMS key that was used to verify the signature.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # A Boolean value that indicates whether the signature was verified. A value of `True` indicates
    # that the `Signature` was produced by signing the `Message` with the specified `KeyID` and
    # `SigningAlgorithm.` If the signature is not verified, the `Verify` operation fails with a
    # `KMSInvalidSignatureException` exception.
    @[JSON::Field(key: "SignatureValid")]
    property signature_valid : Bool | Nil

    # The signing algorithm that was used to verify the signature.
    @[JSON::Field(key: "SigningAlgorithm", converter: AK::SigningAlgorithmSpec)]
    property signing_algorithm : SigningAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @signature_valid : Bool | Nil = nil,
      @signing_algorithm : SigningAlgorithmSpec | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @signature_valid, @signing_algorithm)
  end
end
