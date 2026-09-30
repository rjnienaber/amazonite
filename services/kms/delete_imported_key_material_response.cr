private alias Core = Amazonite::Core

module Amazonite::Kms
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

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @key_material_id
        raise Core::ValidationError.new("KeyMaterialId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KeyMaterialId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("KeyMaterialId does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]+$"))
      end
    end

    def_equals_and_hash(@key_id, @key_material_id)
  end
end
