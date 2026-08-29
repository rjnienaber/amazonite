module Amazonite::KmsV1
  class DeleteImportedKeyMaterialRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
