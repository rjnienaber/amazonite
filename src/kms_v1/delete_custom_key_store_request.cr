module Amazonite::KmsV1
  class DeleteCustomKeyStoreRequest
    include JSON::Serializable

    # Enter the ID of the custom key store you want to delete. To find the ID of a custom key store,
    # use the DescribeCustomKeyStores operation.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    def initialize(
      @custom_key_store_id : String,
    )
    end
  end
end
