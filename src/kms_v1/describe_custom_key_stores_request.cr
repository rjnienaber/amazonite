module Amazonite::KmsV1
  class DescribeCustomKeyStoresRequest
    include JSON::Serializable

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    @[JSON::Field(key: "CustomKeyStoreName")]
    property custom_key_store_name : String | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @custom_key_store_id : String | Nil = nil,
      @custom_key_store_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end
  end
end
