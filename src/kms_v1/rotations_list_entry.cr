private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class RotationsListEntry
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    @[JSON::Field(key: "KeyMaterialDescription")]
    property key_material_description : String | Nil

    @[JSON::Field(key: "ImportState", converter: AK::ImportState)]
    property import_state : ImportState | Nil

    @[JSON::Field(key: "KeyMaterialState", converter: AK::KeyMaterialState)]
    property key_material_state : KeyMaterialState | Nil

    @[JSON::Field(key: "ExpirationModel", converter: AK::ExpirationModelType)]
    property expiration_model : ExpirationModelType | Nil

    @[JSON::Field(key: "ValidTo", converter: Core::AWSEpochConverter)]
    property valid_to : Time | Nil

    @[JSON::Field(key: "RotationDate", converter: Core::AWSEpochConverter)]
    property rotation_date : Time | Nil

    @[JSON::Field(key: "RotationType", converter: AK::RotationType)]
    property rotation_type : RotationType | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
      @key_material_description : String | Nil = nil,
      @import_state : ImportState | Nil = nil,
      @key_material_state : KeyMaterialState | Nil = nil,
      @expiration_model : ExpirationModelType | Nil = nil,
      @valid_to : Time | Nil = nil,
      @rotation_date : Time | Nil = nil,
      @rotation_type : RotationType | Nil = nil,
    )
    end
  end
end
