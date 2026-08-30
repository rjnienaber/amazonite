private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CreateCustomKeyStoreResponse
    include JSON::Serializable

    # A unique identifier for the new custom key store.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    def initialize(
      @custom_key_store_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @custom_key_store_id
        raise Core::ValidationError.new("CustomKeyStoreId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@custom_key_store_id)
  end
end
