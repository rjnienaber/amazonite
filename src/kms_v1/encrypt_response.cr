private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class EncryptResponse
    include JSON::Serializable

    # The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that was used to encrypt the plaintext.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The encryption algorithm that was used to encrypt the plaintext.
    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ciphertext_blob
        raise Core::ValidationError.new("CiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CiphertextBlob length must be <= 6144") if value.size > 6144
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@ciphertext_blob, @key_id, @encryption_algorithm)
  end
end
