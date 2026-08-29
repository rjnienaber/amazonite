module Amazonite::DynamoDBV2
  # Represents the output of a `GetItem` operation.
  class GetItemOutput
    include JSON::Serializable

    # A map of attribute names to `AttributeValue` objects, as specified by `ProjectionExpression`.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    # The capacity units consumed by the `GetItem` operation. The data returned includes the total
    # provisioned throughput consumed, along with statistics for the table and any indexes involved in
    # the operation. `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity` parameter was
    # specified. For more information, see [Capacity unit consumption for read
    # operations](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
    )
    end
  end
end
