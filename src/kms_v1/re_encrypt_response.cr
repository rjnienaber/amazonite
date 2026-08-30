private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ReEncryptResponse
    include JSON::Serializable

    # The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is
    # Base64-encoded. Otherwise, it is not Base64-encoded.
    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    # Unique identifier of the KMS key used to originally encrypt the data.
    @[JSON::Field(key: "SourceKeyId")]
    property source_key_id : String | Nil

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key that was used to reencrypt the data.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.
    @[JSON::Field(key: "SourceEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property source_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # The encryption algorithm that was used to reencrypt the data.
    @[JSON::Field(key: "DestinationEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    # The identifier of the key material used to originally encrypt the data. This field is present
    # only when the original encryption used a symmetric encryption KMS key.
    @[JSON::Field(key: "SourceKeyMaterialId")]
    property source_key_material_id : String | Nil

    # The identifier of the key material used to reencrypt the data. This field is present only when
    # data is reencrypted using a symmetric encryption KMS key.
    @[JSON::Field(key: "DestinationKeyMaterialId")]
    property destination_key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @source_key_id : String | Nil = nil,
      @key_id : String | Nil = nil,
      @source_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @source_key_material_id : String | Nil = nil,
      @destination_key_material_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ciphertext_blob
        raise Core::ValidationError.new("CiphertextBlob length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CiphertextBlob length must be <= 6144") if value.size > 6144
      end

      if value = @source_key_id
        raise Core::ValidationError.new("SourceKeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceKeyId length must be <= 2048") if value.size > 2048
      end

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @source_key_material_id
        raise Core::ValidationError.new("SourceKeyMaterialId length must be >= 64") if value.size < 64
        raise Core::ValidationError.new("SourceKeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("SourceKeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end

      if value = @destination_key_material_id
        raise Core::ValidationError.new("DestinationKeyMaterialId length must be >= 64") if value.size < 64
        raise Core::ValidationError.new("DestinationKeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("DestinationKeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end
    end

    def_equals_and_hash(@ciphertext_blob, @source_key_id, @key_id, @source_encryption_algorithm, @destination_encryption_algorithm, @source_key_material_id, @destination_key_material_id)
  end
end
