module Amazonite::KmsV1
  class DeleteImportedKeyMaterialResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key from which the key material was deleted.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Identifies the deleted key material.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @key_material_id)
  end
end
