module Amazonite::DynamoDBV2
  class TransactWriteItemsOutput
    include JSON::Serializable

    # The capacity units consumed by the entire `TransactWriteItems` operation. The values of the list
    # are ordered according to the ordering of the `TransactItems` request parameter.
    #
    # If the table has vector indexes, each element also includes a `VectorIndexes` field with
    # `VectorWriteRequestBytes` consumed for each affected vector index.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    # A list of tables that were processed by `TransactWriteItems` and, for each table, information
    # about any item collections that were affected by individual `UpdateItem`, `PutItem`, or
    # `DeleteItem` operations.
    @[JSON::Field(key: "ItemCollectionMetrics")]
    property item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil

    def initialize(
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
      @item_collection_metrics : Hash(String, Array(ItemCollectionMetrics)) | Nil = nil,
    )
    end

    def_equals_and_hash(@consumed_capacity, @item_collection_metrics)
  end
end
