private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class DecryptResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "Plaintext")]
    property plaintext : String | Nil

    @[JSON::Field(key: "EncryptionAlgorithm", converter: AK::EncryptionAlgorithmSpec)]
    property encryption_algorithm : EncryptionAlgorithmSpec | Nil

    @[JSON::Field(key: "CiphertextForRecipient")]
    property ciphertext_for_recipient : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @plaintext : String | Nil = nil,
      @encryption_algorithm : EncryptionAlgorithmSpec | Nil = nil,
      @ciphertext_for_recipient : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
