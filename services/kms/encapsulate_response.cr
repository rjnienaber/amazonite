private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class EncapsulateResponse
    include JSON::Serializable

    # The identifier of the ML-KEM KMS key used to encapsulate the shared secret.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The plaintext shared secret. It is a 32-byte cryptographically random value that both parties
    # can use directly as key material or pass through a key derivation function to generate multiple
    # keys and nonces. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "SharedSecret", converter: Core::Base64Converter)]
    property shared_secret : Bytes | Nil

    # The encapsulated form of the shared secret. Pass this value to the Decapsulate operation to
    # recover the shared secret. When you use the HTTP API or the Amazon Web Services CLI, the value
    # is Base64-encoded. Otherwise, it is not Base64-encoded. The length of
    # `SharedSecretCiphertextBlob` depends on the ML-KEM key spec. Before Base64 encoding, the
    # encapsulated shared secret is 768 bytes for `ML_KEM_512`, 1088 bytes for `ML_KEM_768`, and 1568
    # bytes for `ML_KEM_1024`.
    @[JSON::Field(key: "SharedSecretCiphertextBlob", converter: Core::Base64Converter)]
    property shared_secret_ciphertext_blob : Bytes | Nil

    # The key encapsulation algorithm used to generate the shared secret.
    @[JSON::Field(key: "EncapsulationAlgorithm", converter: AK::EncapsulationAlgorithmSpec)]
    property encapsulation_algorithm : EncapsulationAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @shared_secret : Bytes | Nil = nil,
      @shared_secret_ciphertext_blob : Bytes | Nil = nil,
      @encapsulation_algorithm : EncapsulationAlgorithmSpec | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @shared_secret
        raise Core::ValidationError.new("SharedSecret length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SharedSecret length must be <= 4096") if value.size > 4096
      end

      if value = @shared_secret_ciphertext_blob
        raise Core::ValidationError.new("SharedSecretCiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SharedSecretCiphertextBlob length must be <= 6144") if value.size > 6144
      end
    end

    def_equals_and_hash(@key_id, @shared_secret, @shared_secret_ciphertext_blob, @encapsulation_algorithm)
  end
end
