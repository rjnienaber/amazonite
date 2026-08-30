module Amazonite::DynamoDBV2
  # Represents the output of an `UpdateItem` operation.
  class UpdateItemOutput
    include JSON::Serializable

    # A map of attribute values as they appear before or after the `UpdateItem` operation, as
    # determined by the `ReturnValues` parameter.
    #
    # The `Attributes` map is only present if the update was successful and `ReturnValues` was
    # specified as something other than `NONE` in the request. Each element represents one attribute.
    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(String, AttributeValue) | Nil

    # The capacity units consumed by the `UpdateItem` operation. The data returned includes the total
    # provisioned throughput consumed, along with statistics for the table and any indexes involved in
    # the operation. `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity` parameter was
    # specified. For more information, see [Capacity unity consumption for write
    # operations](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#write-operation-consumption)
    # in the *Amazon DynamoDB Developer Guide*.
    #
    # If the table has vector indexes, the response includes a `VectorIndexes` field with
    # `VectorWriteRequestBytes` consumed for each affected vector index.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    # Information about item collections, if any, that were affected by the `UpdateItem` operation.
    # `ItemCollectionMetrics` is only returned if the `ReturnItemCollectionMetrics` parameter was
    # specified. If the table does not have any local secondary indexes, this information is not
    # returned in the response.
    #
    # Each `ItemCollectionMetrics` element consists of:
    #
    # - `ItemCollectionKey` - The partition key value of the item collection. This is the same as the
    # partition key value of the item itself.
    #
    # - `SizeEstimateRangeGB` - An estimate of item collection size, in gigabytes. This value is a
    # two-element array containing a lower bound and an upper bound for the estimate. The estimate
    # includes the size of all the items in the table, plus the size of all attributes projected into
    # all of the local secondary indexes on that table. Use this estimate to measure whether a local
    # secondary index is approaching its size limit.
    #
    # The estimate is subject to change over time; therefore, do not rely on the precision or accuracy
    # of the estimate.
    @[JSON::Field(key: "ItemCollectionMetrics")]
    property item_collection_metrics : ItemCollectionMetrics | Nil

    def initialize(
      @attributes : Hash(String, AttributeValue) | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
      @item_collection_metrics : ItemCollectionMetrics | Nil = nil,
    )
    end
  end
end
