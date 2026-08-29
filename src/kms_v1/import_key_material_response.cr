module Amazonite::KmsV1
  class ImportKeyMaterialResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key into which key material was imported.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # Identifies the imported key material.
    @[JSON::Field(key: "KeyMaterialId")]
    property key_material_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_material_id : String | Nil = nil,
    )
    end
  end
end
