module Amazonite::DynamoDBv2
  class DeleteItemOutput
    include JSON::Serializable

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    @[JSON::Field(key: "ItemCollectionMetrics")]
    property item_collection_metrics : ItemCollectionMetrics | Nil

    def initialize(
      @attributes : Hash(String, AttributeValue) | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
      @item_collection_metrics : ItemCollectionMetrics | Nil = nil
    )
    end
  end
end
