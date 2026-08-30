module Amazonite::KmsV1
  class DisconnectCustomKeyStoreRequest
    include JSON::Serializable

    # Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key
    # store, use the DescribeCustomKeyStores operation.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    def initialize(
      @custom_key_store_id : String,
    )
    end

    def_equals_and_hash(@custom_key_store_id)
  end
end
