module Amazonite::KmsV1
  class ImportKeyMaterialResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
