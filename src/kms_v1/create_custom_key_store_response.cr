module Amazonite::KmsV1
  class CreateCustomKeyStoreResponse
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    def initialize(
      @custom_key_store_id : String | Nil = nil,
    )
    end
  end
end
