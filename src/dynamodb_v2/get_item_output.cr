module Amazonite::DynamoDBV2
  class GetItemOutput
    include JSON::Serializable

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil
    )
    end
  end
end
