private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class TransactGetItemsInput
    include JSON::Serializable

    # An ordered array of up to 100 `TransactGetItem` objects, each of which contains a `Get`
    # structure.
    @[JSON::Field(key: "TransactItems")]
    property transact_items : Array(TransactGetItem) = [] of TransactGetItem

    # A value of `TOTAL` causes consumed capacity information to be returned, and a value of `NONE`
    # prevents that information from being returned. No other value is valid.
    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @transact_items : Array(TransactGetItem),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
    )
    end

    def_equals_and_hash(@transact_items, @return_consumed_capacity)
  end
end
