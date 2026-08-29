module Amazonite::KmsV1
  class ConnectCustomKeyStoreRequest
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    def initialize(
      @custom_key_store_id : String,
    )
    end
  end
end
