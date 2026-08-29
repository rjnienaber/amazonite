private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class ReEncryptResponse
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob")]
    property ciphertext_blob : String | Nil

    @[JSON::Field(key: "SourceKeyId")]
    property source_key_id : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "SourceEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property source_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "DestinationEncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "SourceKeyMaterialId")]
    property source_key_material_id : String | Nil

    @[JSON::Field(key: "DestinationKeyMaterialId")]
    property destination_key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : String | Nil = nil,
      @source_key_id : String | Nil = nil,
      @key_id : String | Nil = nil,
      @source_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @destination_encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @source_key_material_id : String | Nil = nil,
      @destination_key_material_id : String | Nil = nil,
    )
    end
  end
end
