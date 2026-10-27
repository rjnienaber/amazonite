private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  class DecapsulateResponse
    include JSON::Serializable

    # The identifier of the ML-KEM KMS key used to decapsulate the shared secret.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The plaintext shared secret recovered from the encapsulated form. It is a 32-byte value that
    # matches the shared secret held by the encapsulating party. When you use the HTTP API or the
    # Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "SharedSecret", converter: Core::Base64Converter)]
    property shared_secret : Bytes | Nil

    # The key encapsulation algorithm used to recover the shared secret.
    @[JSON::Field(key: "EncapsulationAlgorithm", converter: AK::EncapsulationAlgorithmSpec)]
    property encapsulation_algorithm : EncapsulationAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @shared_secret : Bytes | Nil = nil,
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
    end

    def_equals_and_hash(@key_id, @shared_secret, @encapsulation_algorithm)
  end
end
