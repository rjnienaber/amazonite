private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateDataKeyPairWithoutPlaintextResponse
    include JSON::Serializable

    @[JSON::Field(key: "PrivateKeyCiphertextBlob", converter: Core::Base64Converter)]
    property private_key_ciphertext_blob : Bytes | Nil

    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyPairSpec", converter: AK::DataKeyPairSpec)]
    property key_pair_spec : DataKeyPairSpec | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @private_key_ciphertext_blob : Bytes | Nil = nil,
      @public_key : Bytes | Nil = nil,
      @key_id : String | Nil = nil,
      @key_pair_spec : DataKeyPairSpec | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
