module Amazonite::DynamoDBV2
  class ItemResponse
    include JSON::Serializable

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end
