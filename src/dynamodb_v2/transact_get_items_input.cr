private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class TransactGetItemsInput
    include JSON::Serializable

    @[JSON::Field(key: "TransactItems")]
    property transact_items : Array(TransactGetItem)

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @transact_items : Array(TransactGetItem),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil
    )
    end
  end
end
