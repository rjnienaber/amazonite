private alias Core = Amazonite::Core

module Amazonite::Kms
  class GenerateDataKeyWithoutPlaintextResponse
    include JSON::Serializable

    # The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that encrypted the data key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The identifier of the key material used to encrypt the data key.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
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

      if value = @key_material_id
        raise Core::ValidationError.new("KeyMaterialId length must be >= 64") if value.size < 64
        raise Core::ValidationError.new("KeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("KeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end
    end

    def_equals_and_hash(@ciphertext_blob, @key_id, @key_material_id)
  end
end
