private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class TransactWriteItemsInput
    include JSON::Serializable

    @[JSON::Field(key: "TransactItems")]
    property transact_items : Array(TransactWriteItem)

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    def initialize(
      @transact_items : Array(TransactWriteItem),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil,
      @client_request_token : String | Nil = nil
    )
    end
  end
end
