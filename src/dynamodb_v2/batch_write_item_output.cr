module Amazonite::DynamoDBV2
  class BatchWriteItemOutput
    include JSON::Serializable

    @[JSON::Field(key: "UnprocessedItems")]
    property unprocessed_items : Hash(String, Array(WriteRequest)) | Nil

    @[JSON::Field(key: "ItemCollectionMetrics")]
    property item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @unprocessed_items : Hash(String, Array(WriteRequest)) | Nil = nil,
      @item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil
    )
    end
  end
end
