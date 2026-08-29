private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class EncryptResponse
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
    )
    end
  end
end
