module Amazonite::DynamoDBV2
  class TransactWriteItemsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    @[JSON::Field(key: "ItemCollectionMetrics")]
    property item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil

    def initialize(
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
      @item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil = nil
    )
    end
  end
end
