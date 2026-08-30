private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class TransactWriteItemsInput
    include JSON::Serializable

    # An ordered array of up to 100 `TransactWriteItem` objects, each of which contains a
    # `ConditionCheck`, `Put`, `Update`, or `Delete` object. These can operate on items in different
    # tables, but the tables must reside in the same Amazon Web Services account and Region, and no
    # two of them can operate on the same item.
    @[JSON::Field(key: "TransactItems")]
    property transact_items : Array(TransactWriteItem) = [] of TransactWriteItem

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # Determines whether item collection metrics are returned. If set to `SIZE`, the response includes
    # statistics about item collections (if any), that were modified during the operation and are
    # returned in the response. If set to `NONE` (the default), no statistics are returned.
    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    # Providing a `ClientRequestToken` makes the call to `TransactWriteItems` idempotent, meaning that
    # multiple identical calls have the same effect as one single call.
    #
    # Although multiple identical calls using the same client request token produce the same result on
    # the server (no side effects), the responses to the calls might not be the same. If the
    # `ReturnConsumedCapacity` parameter is set, then the initial `TransactWriteItems` call returns
    # the amount of write capacity units consumed in making the changes. Subsequent
    # `TransactWriteItems` calls with the same client token return the number of read capacity units
    # consumed in reading the item.
    #
    # A client request token is valid for 10 minutes after the first request that uses it is
    # completed. After 10 minutes, any request with the same client token is treated as a new request.
    # Do not resubmit the same request with the same client token for more than 10 minutes, or the
    # result might not be idempotent.
    #
    # If you submit a request with the same client token but a change in other parameters within the
    # 10-minute idempotency window, DynamoDB returns an `IdempotentParameterMismatch` exception.
    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    def initialize(
      @transact_items : Array(TransactWriteItem),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil,
      @client_request_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @transact_items
        raise Core::ValidationError.new("TransactItems must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("TransactItems must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 36") if value.size > 36
      end
    end

    def_equals_and_hash(@transact_items, @return_consumed_capacity, @return_item_collection_metrics, @client_request_token)
  end
end
