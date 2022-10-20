module Amazonite::DynamoDBv2
  class ExecuteStatementOutput
    include JSON::Serializable

    @[JSON::Field(key: "Items")]
    property items : Array(Hash(String, AttributeValue)) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : ConsumedCapacity | Nil

    @[JSON::Field(key: "LastEvaluatedKey")]
    property last_evaluated_key : Hash(String, AttributeValue) | Nil

    def initialize(
      @items : Array(Hash(String, AttributeValue)) | Nil = nil,
      @next_token : String | Nil = nil,
      @consumed_capacity : ConsumedCapacity | Nil = nil,
      @last_evaluated_key : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end
