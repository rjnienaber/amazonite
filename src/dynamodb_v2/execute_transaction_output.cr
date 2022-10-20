module Amazonite::DynamoDBv2
  class ExecuteTransactionOutput
    include JSON::Serializable

    @[JSON::Field(key: "Responses")]
    property responses : Array(ItemResponse) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @responses : Array(ItemResponse) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil
    )
    end
  end
end
