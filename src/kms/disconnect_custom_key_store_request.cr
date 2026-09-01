private alias Core = Amazonite::Core

module Amazonite::Kms
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

    def validate! : Nil
      if value = @custom_key_store_id
        raise Core::ValidationError.new("CustomKeyStoreId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@custom_key_store_id)
  end
end
