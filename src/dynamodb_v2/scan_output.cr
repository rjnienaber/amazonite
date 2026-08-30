module Amazonite::DynamoDBV2
  # Represents the output of a `Scan` operation.
  class ScanOutput
    include JSON::Serializable

    # An array of item attributes that match the scan criteria. Each element in this array consists of
    # an attribute name and the value for that attribute.
    @[JSON::Field(key: "Items")]
    property items : Array(Hash(String, AttributeValue)) | Nil

    # The number of items in the response.
    #
    # If you set `ScanFilter` in the request, then `Count` is the number of items returned after the
    # filter was applied, and `ScannedCount` is the number of matching items before the filter was
    # applied.
    #
    # If you did not use a filter in the request, then `Count` is the same as `ScannedCount`.
    @[JSON::Field(key: "Count")]
    property count : Int32 | Nil

    # The number of items evaluated, before any `ScanFilter` is applied. A high `ScannedCount` value
    # with few, or no, `Count` results indicates an inefficient `Scan` operation. For more
    # information, see [Count and
    # ScannedCount](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count)
    # in the *Amazon DynamoDB Developer Guide*.
    #
    # If you did not use a filter in the request, then `ScannedCount` is the same as `Count`.
    @[JSON::Field(key: "ScannedCount")]
    property scanned_count : Int32 | Nil

    # The primary key of the item where the operation stopped, inclusive of the previous result set.
    # Use this value to start a new operation, excluding this value in the new request.
    #
    # If `LastEvaluatedKey` is empty, then the "last page" of results has been processed and there is
    # no more data to be retrieved.
    #
    # If `LastEvaluatedKey` is not empty, it does not necessarily mean that there is more data in the
    # result set. The only way to know when you have reached the end of the result set is when
    # `LastEvaluatedKey` is empty.
    @[JSON::Field(key: "LastEvaluatedKey")]
    property last_evaluated_key : Hash(String, AttributeValue) | Nil

    # The capacity units consumed by the `Scan` operation. The data returned includes the total
    # provisioned throughput consumed, along with statistics for the table and any indexes involved in
    # the operation. `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity` parameter was
    # specified. For more information, see [Capacity unit consumption for read
    # operations](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/read-write-operations.html#read-operation-consumption)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    def initialize(
      @items : Array(Hash(String, AttributeValue)) | Nil = nil,
      @count : Int32 | Nil = nil,
      @scanned_count : Int32 | Nil = nil,
      @last_evaluated_key : Hash(String, AttributeValue) | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
    )
    end

    def_equals_and_hash(@items, @count, @scanned_count, @last_evaluated_key, @consumed_capacity)
  end
end
