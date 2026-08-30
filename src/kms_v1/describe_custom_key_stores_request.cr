private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class DescribeCustomKeyStoresRequest
    include JSON::Serializable

    # Gets only information about the specified custom key store. Enter the key store ID.
    #
    # By default, this operation gets information about all custom key stores in the account and
    # Region. To limit the output to a particular custom key store, provide either the
    # `CustomKeyStoreId` or `CustomKeyStoreName` parameter, but not both.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    # Gets only information about the specified custom key store. Enter the friendly name of the
    # custom key store.
    #
    # By default, this operation gets information about all custom key stores in the account and
    # Region. To limit the output to a particular custom key store, provide either the
    # `CustomKeyStoreId` or `CustomKeyStoreName` parameter, but not both.
    @[JSON::Field(key: "CustomKeyStoreName")]
    property custom_key_store_name : String | Nil

    # Use this parameter to specify the maximum number of items to return. When this value is present,
    # KMS does not return more than the specified number of items, but it might return fewer.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # Use this parameter in a subsequent request after you receive a response with truncated results.
    # Set it to the value of `NextMarker` from the truncated response you just received.
    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @custom_key_store_id : String | Nil = nil,
      @custom_key_store_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @custom_key_store_id
        raise Core::ValidationError.new("CustomKeyStoreId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreId length must be <= 64") if value.size > 64
      end

      if value = @custom_key_store_name
        raise Core::ValidationError.new("CustomKeyStoreName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreName length must be <= 256") if value.size > 256
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 1000") if value > 1000
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[\\u0020-\\u00FF]*$"))
      end
    end

    def_equals_and_hash(@custom_key_store_id, @custom_key_store_name, @limit, @marker)
  end
end
