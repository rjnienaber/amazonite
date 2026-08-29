module Amazonite::KmsV1
  class GenerateDataKeyResponse
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob")]
    property ciphertext_blob : String | Nil

    @[JSON::Field(key: "Plaintext")]
    property plaintext : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "CiphertextForRecipient")]
    property ciphertext_for_recipient : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : String | Nil = nil,
      @plaintext : String | Nil = nil,
      @key_id : String | Nil = nil,
      @ciphertext_for_recipient : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
