module Amazonite::DynamoDBv2
  class BatchGetItemOutput
    include JSON::Serializable

    @[JSON::Field(key: "Responses")]
    property responses : Hash(String, Array(Hash(String, AttributeValue))) | Nil

    @[JSON::Field(key: "UnprocessedKeys")]
    property unprocessed_keys : Hash(String, KeysAndAttributes) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @responses : Hash(String, Array(Hash(String, AttributeValue))) | Nil = nil,
      @unprocessed_keys : Hash(String, KeysAndAttributes) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil
    )
    end
  end
end
