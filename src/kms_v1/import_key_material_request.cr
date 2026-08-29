private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ImportKeyMaterialRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "ImportToken", converter: Core::Base64Converter)]
    property import_token : Bytes

    @[JSON::Field(key: "EncryptedKeyMaterial", converter: Core::Base64Converter)]
    property encrypted_key_material : Bytes

    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    @[JSON::Field(key: "ImportType", converter: AK::ImportType)]
    property import_type : ImportType | Nil

    @[JSON::Field(key: "KeyMaterialDescription")]
    property key_material_description : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String,
      @import_token : Bytes,
      @encrypted_key_material : Bytes,
      @valid_to : Time | Nil = nil,
      @expiration_model : ExpirationModelType | Nil = nil,
      @import_type : ImportType | Nil = nil,
      @key_material_description : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
