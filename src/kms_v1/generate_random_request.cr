module Amazonite::KmsV1
  class GenerateRandomRequest
    include JSON::Serializable

    @[JSON::Field(key: "NumberOfBytes")]
    property number_of_bytes : Int32 | Nil

    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String | Nil

    @[JSON::Field(key: "Recipient")]
    property recipient : RecipientInfo | Nil

    def initialize(
      @number_of_bytes : Int32 | Nil = nil,
      @custom_key_store_id : String | Nil = nil,
      @recipient : RecipientInfo | Nil = nil,
    )
    end
  end
end
