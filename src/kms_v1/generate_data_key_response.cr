private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateDataKeyResponse
    include JSON::Serializable

    @[JSON::Field(key: "CiphertextBlob", converter: Core::Base64Converter)]
    property ciphertext_blob : Bytes | Nil

    @[JSON::Field(key: "Plaintext", converter: Core::Base64Converter)]
    property plaintext : Bytes | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "CiphertextForRecipient", converter: Core::Base64Converter)]
    property ciphertext_for_recipient : Bytes | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @ciphertext_blob : Bytes | Nil = nil,
      @plaintext : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @ciphertext_for_recipient : Bytes | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
