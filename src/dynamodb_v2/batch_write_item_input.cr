private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class BatchWriteItemInput
    include JSON::Serializable

    @[JSON::Field(key: "RequestItems")]
    property request_items : Hash(String, Array(WriteRequest))

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    def initialize(
      @request_items : Hash(String, Array(WriteRequest)),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil
    )
    end
  end
end
