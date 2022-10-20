private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class BatchGetItemInput
    include JSON::Serializable

    @[JSON::Field(key: "RequestItems")]
    property request_items : Hash(String, KeysAndAttributes)

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @request_items : Hash(String, KeysAndAttributes),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil
    )
    end
  end
end