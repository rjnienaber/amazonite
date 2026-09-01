private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ExecuteStatementOutput
    include JSON::Serializable

    # If a read operation was used, this property will contain the result of the read operation; a map
    # of attribute names and their values. For the write operations this value will be empty.
    @[JSON::Field(key: "Items")]
    property items : Array(Hash(String, AttributeValue)) | Nil

    # If the response of a read request exceeds the response payload limit DynamoDB will set this
    # value in the response. If set, you can use that this value in the subsequent request to get the
    # remaining results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    # The primary key of the item where the operation stopped, inclusive of the previous result set.
    # Use this value to start a new operation, excluding this value in the new request. If
    # `LastEvaluatedKey` is empty, then the "last page" of results has been processed and there is no
    # more data to be retrieved. If `LastEvaluatedKey` is not empty, it does not necessarily mean that
    # there is more data in the result set. The only way to know when you have reached the end of the
    # result set is when `LastEvaluatedKey` is empty.
    @[JSON::Field(key: "LastEvaluatedKey")]
    property last_evaluated_key : Hash(String, AttributeValue) | Nil

    def initialize(
      @items : Array(Hash(String, AttributeValue)) | Nil = nil,
      @next_token : String | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
      @last_evaluated_key : Hash(String, AttributeValue) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 32768") if value.size > 32768
      end

      if value = @consumed_capacity
        value.validate!
      end

      if value = @last_evaluated_key
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@items, @next_token, @consumed_capacity, @last_evaluated_key)
  end
end
