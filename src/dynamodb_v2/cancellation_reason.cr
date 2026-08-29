module Amazonite::DynamoDBV2
  class CancellationReason
    include JSON::Serializable

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "Code")]
    property code : String | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end
  end
end
