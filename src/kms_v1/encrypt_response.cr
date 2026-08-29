private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class EncryptResponse
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob")]
    property ciphertext_blob : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    def initialize(
      @ciphertext_blob : String | Nil = nil,
      @key_id : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
    )
    end
  end
end
