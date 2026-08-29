module Amazonite::KmsV1
  class ConnectCustomKeyStoreRequest
    include JSON::Serializable

    # Enter the key store ID of the custom key store that you want to connect. To find the ID of a
    # custom key store, use the DescribeCustomKeyStores operation.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    def initialize(
      @custom_key_store_id : String,
    )
    end
  end
end
