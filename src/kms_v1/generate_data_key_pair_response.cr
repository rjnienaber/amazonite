private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateDataKeyPairResponse
    include JSON::Serializable

    @[JSON::Field(key: "PrivateKeyCiphertextBlob")]
    property private_key_ciphertext_blob : String | Nil

    @[JSON::Field(key: "PrivateKeyPlaintext")]
    property private_key_plaintext : String | Nil

    @[JSON::Field(key: "PublicKey")]
    property public_key : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyPairSpec", converter: AK::DataKeyPairSpec)]
    property key_pair_spec : DataKeyPairSpec | Nil

    @[JSON::Field(key: "CiphertextForRecipient")]
    property ciphertext_for_recipient : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @private_key_ciphertext_blob : String | Nil = nil,
      @private_key_plaintext : String | Nil = nil,
      @public_key : String | Nil = nil,
      @key_id : String | Nil = nil,
      @key_pair_spec : DataKeyPairSpec | Nil = nil,
      @ciphertext_for_recipient : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
